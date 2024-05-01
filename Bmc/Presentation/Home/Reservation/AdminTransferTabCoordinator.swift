//
//  AdminTransferTabCoordinator.swift
//  Bmc
//
//  Created by Serhan Khan on 31/03/2024.
//

import SwiftUI
import Router
import Reservation
import Domain

struct AdminTransferTabCoordinator: View {

    @EnvironmentObject private var router: Router
    @EnvironmentObject private var configuration: Configuration
    
    @Binding private var adminProfile: AdminMainProfile?
    
    init(adminMainProfile: Binding<AdminMainProfile?>) {
        _adminProfile = adminMainProfile
    }
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            AdminTransferCoordinator(dependecies: .init(networkClient: configuration.getNetworkClient()), adminProfile: $adminProfile)
                .toolbar(.visible ,for: .tabBar)
        }.environmentObject(router)
    }
}
