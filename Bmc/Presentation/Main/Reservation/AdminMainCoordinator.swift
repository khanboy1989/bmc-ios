//
//  AdminMainCoordinator.swift
//  Bmc
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Reservation
import Router
import Network
import Utilities
import DomainData

// Define a SwiftUI view struct for AdminMainCoordinator
public struct AdminMainCoordinator: View {
    
    // ObservedObject to manage routing
    @ObservedObject private var router = Router()
    
    // EnvironmentObject for configuration
    @EnvironmentObject private var configuration: Configuration
    
    // EnvironmentObject for the root coordinator
    @EnvironmentObject private var appRootCoordinator: AppRootCoordinator
    

    // Body of the view
    public var body: some View {
        AdminMainTabViewCoordinator(dependecies: .init(
            networkClient: configuration.getNetworkClient(), 
            userDefaults: configuration.getUserDefaultsService()))
            .environmentObject(router)
    }
}



