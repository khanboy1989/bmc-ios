//
//  AdminRentalCoordinator.swift
//  
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Router
import Domain
import DomainData

public struct AdminRentalCoordinator: View {
    
    @EnvironmentObject private var router: Router
    @Binding var adminProfile: AdminMainProfile?
    
    public init(adminProfile: Binding<AdminMainProfile?>) {
        _adminProfile = adminProfile
    }
    
    public var body: some View  {
        AdminCarRentalReservationsView(adminProfile: $adminProfile)
    }
    
}



