//
//  AdminMainTabViewCoordinator.swift
//
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Router

public struct AdminMainTabViewCoordinator: View {
    
    @State private var selectedTab: Int = 0
    @EnvironmentObject private var router: Router
    
    public init() {}
    
    public var body: some View {
        TabView(selection: $selectedTab) {
            AdminRentalCoordinator()
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
        }
    }
}
