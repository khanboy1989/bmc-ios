//
//  AdminCarRentalReservationsView.swift
//
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Domain
import DomainData
import CommonUI
import SystemDesign

public struct AdminCarRentalReservationsView: View {

    @Binding var adminProfile: AdminMainProfile?
    @StateObject private var viewModel: AdminRentalReservationViewModel
    
    public init(reservationRepository: ReservationRepository,  adminProfile: Binding<AdminMainProfile?>) {
        _viewModel = .init(wrappedValue: AdminRentalReservationViewModel(dependecise: .init(reservationRepository: reservationRepository)))
        _adminProfile = adminProfile
    }
    
    public var body: some View {
        VStack {
            AdminProfileHeaderView(imageUrl: $viewModel.imageUrl, 
                                   adminFirstName: $viewModel.adminUserName,
                                   adminLastName: $viewModel.adminLastName,
                                   title: L10n.rentalCarsHeaderTitle)
            Spacer()
            List(viewModel.rentalReservations) { item in
                Text(item.customer.name)
            }
        }.task {
             self.viewModel.fetchRentals()
        }
        .onChange(of: adminProfile, debounceTime: .milliseconds(500)) { newValue in
            viewModel.prepareHeaderDataView(adminProfile: newValue)
        }
    }
}



