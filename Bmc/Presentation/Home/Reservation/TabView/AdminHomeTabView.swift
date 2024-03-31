//
//  AdminHomeTabView.swift
//  Bmc
//
//  Created by Serhan Khan on 31/03/2024.
//

import SwiftUI
import Router
import DomainData
import SystemDesign

struct AdminHomeTabView: View {
    //State
    @State private var selectedTab: Int = 0
    
    //Observed & State Objects
    @StateObject private var viewModel: AdminHomeTabViewModel
    @ObservedObject private var router = Router()
    
    //EnvironmentObjects
    @EnvironmentObject private var configuration: Configuration
    @EnvironmentObject private var appRootCoordinator: AppRootCoordinator
    
    //init
    init(dependecies: AdminHomeTabViewModel.Dependecies) {
        let viewModel = AdminHomeTabViewModel(dependecies: dependecies)
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    public var body: some View {
        TabView(selection: $selectedTab) {
            AdminRentalTabCoordinator(adminMainProfile: $viewModel.profile)
                .tabItem {
                    Image(systemName: "car")
                        .foregroundStyle(Asset.Colors.secondaryColor.swiftUIColor)
                    Text(L10n.rentalTabItemTitle)
                    
                }
            AdminTransferTabCoordinator(adminMainProfile: $viewModel.profile)
                .tabItem {
                    Image(systemName: "truck.pickup.side")
                        .foregroundStyle(Asset.Colors.secondaryColor.swiftUIColor)
                    Text(L10n.transferTabItemTitle)
                }
        }.accentColor(Asset.Colors.primaryColor.swiftUIColor)
            .onChange(of: viewModel.shouldLogout, perform: { newValue in
                if newValue {
                    appRootCoordinator.current = .adminLogin
                }
            })
        .task {
            await self.viewModel.fetchProfile()
        }.environmentObject(configuration)
        .environmentObject(appRootCoordinator)
        .environmentObject(router)
    }
}


