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
    let configuration: Configuration
    
    init() {
        let deviceConfig = DeviceConfiguration()
        //inherits the configuration for start
        self.configuration = Configuration(deviceDisplayName: deviceConfig.getDeviceDisplayName())
    }
    
    var body: some Scene {
        WindowGroup {
            AdminLoginMainCoordinator()
                .environmentObject(configuration)
//            LoginView()
        }
    }
}
