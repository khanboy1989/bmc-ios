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
    
    public func request(_ endpoint: any EndpointType) async -> Result<APIResponse, APIError> {
        let result = await self.apiClientService.request(endpoint)
        
        switch result {
        case let .success(response):
            return .success(response)
        case let .failure(error):
            
        }
        
    }
    
    public func request<T>(_ endpoint: any EndpointType, for type: T.Type) async throws -> T where T : Decodable {
        return try await self.apiClientService.request(endpoint, for: type)
    }
    
    public func request<T, M>(_ endpoint: any Network.EndpointType, mapper: M) async throws -> T where T == M.Output, M : Network.Mappable {
        return try await self.apiClientService.request(endpoint, mapper: mapper)
    }
    
    private func handleError(error: APIError) -> APIError {
        switch error {
        case let .networkError(error, statusCode):
            guard let statusCode = statusCode else { return }
        case let .customError(message, statusCode):
            guard let statusCode = statusCode else { return }
        default:
            return error
        }
    }
    
    private func refreshToken() {
        
    }
}
