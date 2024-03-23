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
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            AdminLoginCoordinator(dependecies: AdminLoginCoordinator.Dependecies.init(networkClient: configuration.getNetworkClient(), keyChainService: configuration.getKeyChainService()))
                .navigationDestination(for: LoginDestination.self) { destination in
                    switch destination {
                    case .home:
                        AdminMainCoordinator()
                            .navigationBarBackButtonHidden()
                    }
                }
        }.environmentObject(router)
    }
}

#Preview {
    AdminLoginMainCoordinator()
}
