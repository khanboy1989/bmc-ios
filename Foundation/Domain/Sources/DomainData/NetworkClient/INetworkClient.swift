//
//  INetworkClient.swift
//  
//
//  Created by Serhan Khan on 22/03/2024.
//

import Foundation
import Network

public protocol INetworkClient {
    func request(_ endpoint: EndpointType) async -> Result<APIResponse, APIError>
    func request<T: Decodable>(_ endpoint: EndpointType, for type: T.Type) async throws -> T
    func request<T, M: Mappable>(_ endpoint: EndpointType, mapper: M) async throws -> T where M.Output == T
    func refreshTokenAndRetryRequest() async throws
}
