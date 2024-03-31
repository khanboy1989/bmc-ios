//
//  AdminCarRentalReservationsView.swift
//
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Domain
import CommonUI
import SystemDesign
import Combine

public struct AdminCarRentalReservationsView: View {

    @Binding var adminProfile: AdminMainProfile?
    @StateObject private var viewModel: AdminRentalReservationViewModel
    
    public init(adminProfile: Binding<AdminMainProfile?>) {
        _viewModel = .init(wrappedValue: AdminRentalReservationViewModel())
        _adminProfile = adminProfile
    }
    
    public var body: some View {
        VStack {
            AdminProfileHeaderView(imageUrl: $viewModel.imageUrl, 
                                   adminFirstName: $viewModel.adminUserName,
                                   adminLastName: $viewModel.adminLastName,
                                   title: L10n.rentalCarsHeaderTitle)
            Spacer()
        }
        .onChange(of: adminProfile, debounceTime: .milliseconds(500)) { newValue in
            viewModel.prepareHeaderDataView(adminProfile: newValue)
        }
    }
}

