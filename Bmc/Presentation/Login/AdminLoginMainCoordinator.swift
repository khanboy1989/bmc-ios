//
//  AdminLoginMainCoordinator.swift
//  Bmc
//
//  Created by Serhan Khan on 10/03/2024.
//

import SwiftUI
import Router
import Login


struct AdminLoginMainCoordinator: View {
    @ObservedObject private var router = Router()
    @EnvironmentObject private var configuration: Configuration
    @EnvironmentObject private var appRootCoordinator: AppRootCoordinator 
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            AdminLoginCoordinator(dependecies: AdminLoginCoordinator.Dependecies.init(networkClient: configuration.getNetworkClient(), keyChainService: configuration.getKeyChainService(), userDefaults: configuration.getUserDefaultsService()))
        }
    
    }
}

#Preview {
    AdminLoginMainCoordinator()
}
