//
//  BmcApp.swift
//  Bmc
//
//  Created by Serhan Khan on 09/03/2024.
//

import SwiftUI
import Logger
import Network
import Router

@main
struct BmcApp: App {
    private let configuration: Configuration
    private let keyChainClient: KeychainClient
    private let userDefaultsClient: UserDefaultsClient
    @StateObject private var appRootCoordinator: AppRootCoordinator
    
    init() {
        //Device Config from Client
        let deviceConfig = DeviceConfiguration()
        
        //Inherits the configuration for start
        self.configuration = Configuration(deviceDisplayName: deviceConfig.getDeviceDisplayName(), serviceIdentifier: Bundle().identifier)
        self.keyChainClient = KeychainClient(keyChainService: configuration.getKeyChainService())
        self.userDefaultsClient = UserDefaultsClient(userDefaultsService: configuration.getUserDefaultsService())
        
        // Initial Coordinator Type from UserDefaults
        let initialCoordinatorType: AppRootCoordinator.CoordinatorType = userDefaultsClient.isLoggedIn() ? .adminHome : .adminLogin
        
        self._appRootCoordinator = StateObject(wrappedValue: AppRootCoordinator(current: initialCoordinatorType))
    }
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootCoordinator.current {
                case .adminLogin:
                    AdminLoginMainCoordinator()
                case .adminHome:
                    AdminMainCoordinator()
                }
            }
            .environmentObject(appRootCoordinator)
            .environmentObject(configuration)
        }
    }
}
