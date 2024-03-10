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
        let logger = Logger(label: "Bmc")
        let apiClientService = APIClientService(logger: logger)
        configuration = .init(logger: logger, apiClientService: apiClientService)
    }
    
  
    var body: some Scene {
        WindowGroup {
            LoginMainCoordinator()
                .environmentObject(configuration)
        }
    }
}
