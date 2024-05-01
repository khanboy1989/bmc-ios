//
//  AdminTranferReservationsView.swift
//  
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Domain
import Router
import DomainData
import CommonUI

public struct AdminTranferReservationsView: View {
    
    @Binding var adminProfile: AdminMainProfile?
    
    @StateObject private var viewModel: AdminTranferReservationViewModel
    
    @EnvironmentObject private var router: Router
    
    public init(reservationRepository: ReservationRepository, adminProfile: Binding<AdminMainProfile?>) {
        _viewModel = .init(wrappedValue: AdminTranferReservationViewModel(dependecise: .init(reservationRepository: reservationRepository)))
        
        _adminProfile = adminProfile
    }
    
    public var body: some View {
        Text("AdminTranferReservationsView")
            .onLoad(perform: {
                self.viewModel.fetchTransfers()
            })
    }
    
    
}
