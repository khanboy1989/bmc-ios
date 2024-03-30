//
//  AdminRentalCoordinator.swift
//  
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Router
import Domain

public struct AdminRentalCoordinator: View {
    
    @EnvironmentObject private var router: Router
    @Binding var adminProfile: AdminMainProfile?
    
    public var body: some View  {
        AdminCarRentalReservationsView(adminProfile: $adminProfile)
    }
    
}


