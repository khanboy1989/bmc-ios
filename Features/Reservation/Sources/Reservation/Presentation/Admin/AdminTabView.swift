//
//  AdminTabView.swift
//
//
//  Created by Serhan Khan on 24/03/2024.
//

import SwiftUI
import Router
import SystemDesign

public struct AdminTabView: View  {
    
    //Environment Objects
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var appCoordinator: AppRootCoordinator
    
    //State
    @State private var selectedTab: Int = 0
    
    //Observed Objects
    @StateObject private var viewModel: AdminTabViewModel
    
    init(dependecies: AdminTabViewModel.Dependecies) {
        _viewModel = .init(wrappedValue: AdminTabViewModel(dependecies: dependecies))
    }
    
    public var body: some View {
        NavigationStack(path: $router.navPath) {
            TabView(selection: $selectedTab) {
                AdminRentalCoordinator(adminProfile: $viewModel.profile)
                    .environmentObject(router)
                    .tabItem {
                        Image(systemName: "car")
                            .foregroundStyle(Asset.Colors.secondaryColor.swiftUIColor)
                        Text(L10n.rentalTabItemTitle)
                        
                    }
                AdminTransferCoordinator()
                    .environmentObject(router)
                    .tabItem {
                        Image(systemName: "truck.pickup.side")
                            .foregroundStyle(Asset.Colors.secondaryColor.swiftUIColor)
                        Text(L10n.transferTabItemTitle)
                        
                    }
            }.accentColor(Asset.Colors.primaryColor.swiftUIColor)
        }.task {
           await self.viewModel.fetchProfile()
        }
    }
}
