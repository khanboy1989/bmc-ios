//
//  AdminTransferCoordinator.swift
//
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Router
import Domain

public struct AdminTransferCoordinator: View {
    
    @EnvironmentObject private var router: Router
    @Binding var adminProfile: AdminMainProfile?
    
    public init(adminProfile: Binding<AdminMainProfile?>) {
        _adminProfile = adminProfile
    }
    
    public var body: some View  {
        AdminTranferReservationsView()
    }
    
}
