//
//  AdminTabView.swift
//
//
//  Created by Serhan Khan on 24/03/2024.
//

import SwiftUI
import Router

public struct AdminTabView: View  {
    
    @State private var selectedTab: Int = 0
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var appCoordinator: AppRootCoordinator
    @StateObject private var viewModel: AdminTabViewModel
    
    init(dependecies: AdminTabViewModel.Dependecies) {
        _viewModel = .init(wrappedValue: AdminTabViewModel(dependecies: dependecies))
    }
    
    public var body: some View {
        NavigationStack(path: $router.navPath) {
            VStack {
                TabView(selection: $selectedTab) {
                    AdminRentalCoordinator(adminProfile: $viewModel.profile)
                        .environmentObject(router)
                        .tabItem {
                            Image(systemName: "list.bullet.rectangle")
                            Text("Rentals")
                        }
                    
                    AdminTransferCoordinator()
                        .environmentObject(router)
                        .tabItem {
                            Image(systemName: "tray.full")
                            Text("Transfers")
                        }
                }.task {
                    await self.viewModel.fetchProfile()
                }
            }
        }
    }
}
