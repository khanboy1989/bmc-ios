//
//  File.swift
//  
//
//  Created by Serhan Khan on 11/03/2024.
//

import Foundation
import Domain
import Network
import Utilities
import StorageKeys

public final class AuthenticationRepository: IAuthenticationRepository {
   
    private let networkClient: INetworkClient
    private let keyChainService: IKeychainService
    
    public init(networkClient: INetworkClient, keyChainService: IKeychainService) {
        self.networkClient = networkClient
        self.keyChainService = keyChainService
    }
    
    public func login(email: String, password: String) async throws -> AdminAuth {
        do {
            let result = try await networkClient
                .request(AdminApiEndpoints.adminLogin(email: email, password: password), mapper: AdminAuthMapper())
            _ = try self.storeAuth(adminAuth: result, for: Keys.adminAuthentication.rawValue)
            return result
        } catch {
            throw error
        }
    }
    
    public func storeAuth(adminAuth: AdminAuth, for key: String) throws -> Bool {
        do {
            _ = try self.keyChainService.saveToKeychain(adminAuth, for: key)
            return true
        } catch {
            return false
        }
    }
    
    public func loadAuth(for key: String) -> AdminAuth? {
        do {
           let auth =  try self.keyChainService.loadFromKeychain(AdminAuth.self, for: key)
           return auth
        } catch {
           return nil
        }
    }
}
