//
//  AdminNetworkClient.swift
//
//
//  Created by Serhan Khan on 17/03/2024.
//

import Foundation
import Network
import Utilities
import StorageKeys
import Domain

public class AdminNetworkClient: INetworkClient {
    
    private let apiClientService: IAPIClientService
    private let keyChainService: IKeychainService
    
    public init(apiClientService: IAPIClientService, keyChainService: IKeychainService) {
        self.apiClientService = apiClientService
        self.keyChainService = keyChainService
    }
    
    public func request(_ endpoint: EndpointType) async -> Result<APIResponse, APIError> {
        return await withCheckedContinuation { continuation in
            Task.init {
                do {
                    let modifiedEndpoint = try modifyEndpoint(endpoint)
                    let result = await self.apiClientService.request(modifiedEndpoint)
                    
                    switch result {
                    case let .success(response):
                        continuation.resume(returning: .success(response))
                        
                    case let .failure(error):
                        do {
                            try await handleAPIError(error: error)
                            let modifiedEndpoint = try modifyEndpoint(endpoint)
                            let resultAfterRefresh = await self.apiClientService.request(modifiedEndpoint)
                            switch resultAfterRefresh {
                            case let .success(responseAfterRefresh):
                                continuation.resume(returning: .success(responseAfterRefresh))
                            case let .failure(errorAfterRefresh):
                                continuation.resume(returning: .failure(errorAfterRefresh))
                            }
                        } catch {
                            continuation.resume(returning: .failure(.badServerResponse))
                        }
                    }
                }
            }
        }
    }
    
    public func request<T>(_ endpoint: EndpointType, for type: T.Type) async throws -> T where T: Decodable {
        return try await withCheckedThrowingContinuation { continuation in
            Task.init {
                do {
                    let modifiedEndpoint = try modifyEndpoint(endpoint)
                    let result = try await self.apiClientService.request(modifiedEndpoint, for: type)
                    continuation.resume(returning: result)
                } catch let error {
                    if let error = error as? APIError {
                        do {
                            try await handleAPIError(error: error)
                            let modifiedEndpoint = try modifyEndpoint(endpoint)

                            let result = try await self.apiClientService.request(modifiedEndpoint, for: type)
                            continuation.resume(returning: result)
                        } catch{
                            continuation.resume(throwing: error)
                        }
                    } else {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }
    
    
    public func request<T, M>(_ endpoint: any EndpointType, mapper: M) async throws -> T where T == M.Output, M : Network.Mappable {
        return try await withCheckedThrowingContinuation { continuation in
            Task.init {
                do {
                    let modifiedEndpoint = try modifyEndpoint(endpoint)
                    let result = try await self.apiClientService.request(modifiedEndpoint, mapper: mapper)
                    continuation.resume(returning: result)
                } catch let error {
                    if let error = error as? APIError {
                        do {
                            try await handleAPIError(error: error)
                            let modifiedEndpoint = try modifyEndpoint(endpoint)
                            let result = try await self.apiClientService.request(modifiedEndpoint, mapper: mapper)
                            continuation.resume(returning: result)
                        } catch{
                            continuation.resume(throwing: error)
                        }
                    } else {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }
    
    private func handleAPIError(error: APIError) async throws {
        switch error {
        case let .networkError(_, statusCode), let .customError(_, statusCode):
            guard let statusCode = statusCode else {
                throw error // Handle error properly
            }
            
            guard statusCode == 401 else {
                throw error // Handle error properly
            }
            
            // If status code is 401, refresh token and retry request
            try await refreshTokenAndRetryRequest()
            
        default:
            throw error // Handle error properly
        }
    }
    
    private func refreshTokenAndRetryRequest() async throws {
        let endpoint = AdminApiEndpoints.refreshToken()
        do {
            let modifiedEndpoint = try modifyEndpoint(endpoint, shouldRefreshToken: true)
            let result = try await self.request(modifiedEndpoint, mapper: AdminAuthMapper())
            _ = try self.keyChainService.saveToKeychain(result, for: StorageKeys.Keys.adminAuthentication.rawValue)
            
        } catch {
            throw error
        }
    }
    
    private func modifyEndpoint(_ endpointType: EndpointType, shouldRefreshToken: Bool = false) throws -> EndpointType {
        
        do {
            // Get the user Auth model
            guard let auth = try self.keyChainService.loadFromKeychain(AdminAuth.self, for: StorageKeys.Keys.adminAuthentication.rawValue), let headers = endpointType.headers else {
                return endpointType
            }
            
            //Get the
            var modifiedHeaders = headers
            
            if shouldRefreshToken {
                modifiedHeaders["Authorization"] = "Bearer \(auth.refreshToken)"
            } else {
                modifiedHeaders["Authorization"] = "Bearer \(auth.token)"
            }
            let endPointType = APIEndpoint(path: endpointType.path, httpMethod: endpointType.httpMethod, headers: modifiedHeaders, bodyParameters: endpointType.bodyParameters)
            return endPointType
            
        } catch {
            throw error
        }
        
    }
}
