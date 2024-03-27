//
//  AdminCarRentalReservationsView.swift
//  
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Domain
import CommonUI

public struct AdminCarRentalReservationsView: View {
    
    @Binding var adminProfile: AdminMainProfile?
    @ObservedObject private var viewModel: AdminRentalReservationViewModel
    
    public init(adminProfile: Binding<AdminMainProfile?>) {
        _viewModel = .init(wrappedValue: AdminRentalReservationViewModel(adminMainProfile: adminProfile))
        _adminProfile = adminProfile
    }
    
    public var body: some View {
        VStack {
            AdminProfileHeaderView(imageUrl: viewModel.createImageUrl())
            Spacer()
        }
    }
}

