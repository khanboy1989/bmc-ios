//
//  AdminRentalCoordinator.swift
//  
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Router

public struct AdminRentalCoordinator: View {
    
    @EnvironmentObject private var router: Router
    
    public var body: some View  {
        AdminCarRentalReservationsView()
    }
    
}


