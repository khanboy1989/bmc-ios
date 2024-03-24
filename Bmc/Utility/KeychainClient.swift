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

// TODO: Keychain Client May not be implemeted here
// If you can find another workaround changing the SwiftUI RootView from the BMCApp file seek for another solution

final class KeychainClient {
    
    private let keyChainService: IKeychainService
    
    init(keyChainService: IKeychainService) {
        self.keyChainService = keyChainService
    }
    
    func adminAuth() throws -> AdminAuth? {
        return try self.keyChainService.loadFromKeychain(AdminAuth.self, for: StorageKeys.Keys.adminAuthentication.rawValue)
    }
}
