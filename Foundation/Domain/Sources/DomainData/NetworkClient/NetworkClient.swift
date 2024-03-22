//
//  File.swift
//
//
//  Created by Serhan Khan on 17/03/2024.
//

import Foundation
import Network

public protocol INetworkClient {
    func request(_ endpoint: EndpointType) async -> Result<APIResponse, APIError>
    func request<T: Decodable>(_ endpoint: EndpointType, for type: T.Type) async throws -> T
    func request<T, M: Mappable>(_ endpoint: EndpointType, mapper: M) async throws -> T where M.Output == T
}

public class NetworkClient: INetworkClient {
    
    private let apiClientService: IAPIClientService
    
    public init(apiClientService: IAPIClientService) {
        self.apiClientService = apiClientService
    }
    
    public func request(_ endpoint: EndpointType) async -> Result<APIResponse, APIError> {
        return await withCheckedContinuation { continuation in
            Task.init {
                do {
                    let result = await self.apiClientService.request(endpoint)
                    
                    switch result {
                    case let .success(response):
                        continuation.resume(returning: .success(response))
                        
                    case let .failure(error):
                        do {
                            try await handleAPIError(error: error)
                            let resultAfterRefresh = await self.apiClientService.request(endpoint)
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
        return await withCheckedContinuation { continuation in
            Task.init {
                do {
                    let result = try await self.apiClientService.request(endpoint, for: type)
                    continuation.resume(returning: result)
                } catch let error {
                    if let error = error as? APIError {
                        do {
                            try await handleAPIError(error: error)
                            let result = try await self.apiClientService.request(endpoint, for: type)
                            continuation.resume(returning: result)
                        } catch{
                            throw error
                        }
                    } else {
                        throw error
                    }
                }
            }
        }
    }
    
    
    public func request<T, M>(_ endpoint: any EndpointType, mapper: M) async throws -> T where T == M.Output, M : Network.Mappable {
        return await withCheckedContinuation { continuation in
            Task.init {
                do {
                    let result = try await self.apiClientService.request(endpoint, mapper: mapper)
                    continuation.resume(returning: result)
                } catch let error {
                    if let error = error as? APIError {
                        do {
                            try await handleAPIError(error: error)
                            let result = try await self.apiClientService.request(endpoint, mapper: mapper)
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
        
    }
}
