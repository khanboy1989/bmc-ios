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
        if let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            print("Bundle display name = \(name)")
        }
        let logger = Logger(label: Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "BMC")
        
        let apiClientService = APIClientService(logger: logger, configuration: .init(baseURL: URL(string: PlistFiles.apiBaseUrl),
                                                                                     baseHeaders: ["User-agent": "iOS", "X-API-KEY":"\(PlistFiles.apiKey)",
                                                                                                   "content-type": "application/json", "Accept-Language": "en"]))
        configuration = .init(logger: logger, apiClientService: apiClientService)
    }
    
  
    var body: some Scene {
        WindowGroup {
            LoginMainCoordinator()
                .environmentObject(configuration)
        }
    }
}
