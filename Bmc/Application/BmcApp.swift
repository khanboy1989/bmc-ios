//
//  BmcApp.swift
//  Bmc
//
//  Created by Serhan Khan on 09/03/2024.
//

import SwiftUI
import Logger
import Network

@main
struct BmcApp: App {
    private let configuration: Configuration
    private let keyChainClient: KeychainClient
    
    init() {
        let deviceConfig = DeviceConfiguration()
        //inherits the configuration for start
        self.configuration = Configuration(deviceDisplayName: deviceConfig.getDeviceDisplayName(), serviceIdentifier: Bundle().identifier)
        self.keyChainClient = KeychainClient(keyChainService: configuration.getKeyChainService())
    }
    
    var body: some Scene {
        WindowGroup {
            if let _ = try? self.keyChainClient.adminAuth() {
                AdminMainCoordinator()
            } else {
                AdminLoginMainCoordinator()
                    .environmentObject(configuration)
            }
        }
    }
}
