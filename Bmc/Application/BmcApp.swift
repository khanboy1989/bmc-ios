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
import SystemDesign

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
    
    private func setupNavBar() {
        // this is not the same as manipulating the proxy directly
        let appearance = UINavigationBarAppearance()
        
        // this overrides everything you have set up earlier.
        appearance.configureWithTransparentBackground()
        
        // this only applies to big titles
        appearance.largeTitleTextAttributes = [
            .font : FontFamily.SFPro.bold.font(size: 20),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        // this only applies to small titles
        appearance.titleTextAttributes = [
            .font : FontFamily.SFPro.bold.font(size: 20),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        
        //In the following two lines you make sure that you apply the style for good
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        // This property is not present on the UINavigationBarAppearance
        // object for some reason and you have to leave it til the end
        UINavigationBar.appearance().tintColor = .white
        
        UINavigationBar.appearance().backgroundColor = Asset.Colors.primaryColor.color
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
            }.statusBarHidden()
            .environmentObject(appRootCoordinator)
            .environmentObject(configuration)
        }
    }
}
