//
//  BmcApp.swift
//  Bmc
//
//  Created by Serhan Khan on 09/03/2024.
//

import SwiftUI
import Logger
import Network
import Helpers

@main
struct BmcApp: App {
    let configuration: Configuration
    
    init() {
        //inherits the configuration for start
        self.configuration = Configuration()
        
        // Usage:
        let device = UIDevice.current

        let modelIdentifier = device.modelIdentifier
        print("Model Identifier: \(modelIdentifier)")
        print("Device Model: \(ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"])")

        if device.isSimulator {
            print("Running on Simulator")
        } else {
            print("Running on a physical device")
        }

        if let iPhoneModel = mapToiPhones(identifier: modelIdentifier) {
            print("iPhone Model: \(iPhoneModel.displayName)")
        } else {
            print("Not an iPhone")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            LoginMainCoordinator()
                .environmentObject(configuration)
        }
    }
}
