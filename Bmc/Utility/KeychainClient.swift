//
//  KeychainClient.swift
//  Bmc
//
//  Created by Serhan Khan on 23/03/2024.
//

import Foundation
import Utilities
import Domain
import StorageKeys

final class KeychainClient {
    
    private let keyChainService: IKeychainService
    
    init(keyChainService: IKeychainService) {
        self.keyChainService = keyChainService
    }
    
    func adminAuth() throws -> AdminAuth? {
        return try self.keyChainService.loadFromKeychain(AdminAuth.self, for: StorageKeys.Keys.adminAuthentication.rawValue)
    }
}
