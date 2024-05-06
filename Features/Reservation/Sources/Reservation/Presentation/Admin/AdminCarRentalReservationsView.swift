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
import Helpers
import Router
import AlertToast

public struct AdminCarRentalReservationsView: View {
    
    @Binding var adminProfile: AdminMainProfile?
    @StateObject private var viewModel: AdminRentalReservationViewModel
    @EnvironmentObject private var router: Router

    public init(reservationRepository: ReservationRepository,  
                adminProfile: Binding<AdminMainProfile?>) {
        _viewModel = .init(wrappedValue: AdminRentalReservationViewModel(dependecise: .init(reservationRepository: reservationRepository)))
        _adminProfile = adminProfile
    }
    
    public var body: some View {
        VStack {
            AdminProfileHeaderView(imageUrl: viewModel.adminProfile?.profileImage ?? "",
                                   adminFirstName: viewModel.adminProfile?.firstname ?? "",
                                   adminLastName: viewModel.adminProfile?.lastname ?? "",
                                   title: L10n.rentalCarsHeaderTitle)
            Spacer()
            
            if viewModel.rentalReservations.isEmpty &&  !viewModel.isLoading {
                EmptyErrorView(message: L10n.somethingWentWrong, buttonTitle: L10n.tryAgain, action: {
                    self.viewModel.refreshRentals()
                })
            } else {
                ZStack {
                    List(viewModel.rentalReservations, id: \.id) { item in
                        AdminRentalReservationCell(item: item)
                            .onTapGesture {
                                router.navigate(to: AdminRentalReservationDestionation.adminCarRentalDetails(adminReservation: item))
                            }
                    }
                    .scrollIndicators(.hidden)
                    .background(.white)
                }
            }
            Spacer()
        }.refreshable {
            self.viewModel.refreshRentals()
        }
        .onLoad(perform: {
            self.viewModel.fetchRentals()
        })
        .onChange(of: adminProfile, debounceTime: .milliseconds(500)) { newValue in
            viewModel.prepareHeaderDataView(adminProfile: newValue)
        }
        .toast(isPresenting: $viewModel.isLoading, tapToDismiss: false) {
            AlertToast(type: .loading)
        }.toast(isPresenting: $viewModel.showError, duration: 3.0) {
            AlertToast(displayMode:.banner(.pop), type: .error(Color.red), title: viewModel.errorMessage)
        }
    }
}





