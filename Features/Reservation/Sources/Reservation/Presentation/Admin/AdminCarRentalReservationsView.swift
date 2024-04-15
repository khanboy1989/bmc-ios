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

public struct AdminCarRentalReservationsView: View {
    
    @Binding var adminProfile: AdminMainProfile?
    @StateObject private var viewModel: AdminRentalReservationViewModel
    
    public init(reservationRepository: ReservationRepository,  adminProfile: Binding<AdminMainProfile?>) {
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
            List(viewModel.rentalReservations, id: \.id) { item in
                HStack(alignment: .center) {
                    let _ = print("image: \(Constants.imageBaseUrl + item.carInformation.image)")
                    AsyncImage(url: URL(string: Constants.imageBaseUrl + item.carInformation.image)) {
                        image in
                        image.image?
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(4)
                            .frame(width: 40, height: 40)
                            .padding()
                      
                    }
                       
                    Text(item.customer.name)
                        
                    
                }
                
            }
        }.task {
            self.viewModel.fetchRentals()
        }
        .onChange(of: adminProfile, debounceTime: .milliseconds(500)) { newValue in
            viewModel.prepareHeaderDataView(adminProfile: newValue)
        }
    }
}



