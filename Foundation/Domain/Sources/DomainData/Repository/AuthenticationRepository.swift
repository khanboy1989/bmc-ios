//
//  File.swift
//  
//
//  Created by Serhan Khan on 11/03/2024.
//

import Foundation
import Domain
import Network

public final class AuthenticationRepository: IAuthenticationRepository {

    private let apiClientService: IAPIClientService
    
    public init(apiClientService: IAPIClientService) {
        self.apiClientService = apiClientService
    }
    
    
    public func login(email: String, password: String) async throws -> Bool {
        do {
            let result = try await apiClientService
                .request(AdminApiEndpoints.adminLogin(email: email, password: password), for: Result.self)
            
            return result.success
        } catch {
            return false
        }
    }
}
