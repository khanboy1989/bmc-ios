//
//  AdminRetantalDetailsView.swift
//
//
//  Created by Serhan Khan on 17/04/2024.
//

import SwiftUI
import Domain
import CommonUI
import SystemDesign

struct AdminRetantalDetailsView: View {
    
    private let adminRentalReservation: AdminRentalReservation
    let viewModel: AdminRentalDetailsViewModel
    
    init(adminRentalReservation: AdminRentalReservation) {
        self.adminRentalReservation = adminRentalReservation
        self.viewModel = AdminRentalDetailsViewModel()
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                VStack(alignment: .center) {
                    AsyncImageView(imageUrl: adminRentalReservation.carInformation.image, placeHolder: "car", height: 100, width: 100, cornerRadius: 4)
                        .padding()
                    Text(adminRentalReservation.carInformation.plate)
                        .font(FontFamily.SFPro.bold.swiftUIFont(size: 24))
                        .foregroundStyle(.black)
                }
                Divider()
                    .frame(height: 1)
                    .overlay(Color.black)
                
                VStack(spacing: 4) {
                    HStack(alignment: .center, spacing: 4) {
                        Text(L10n.customerName)
                            .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                            .foregroundStyle(.white)
                        Text(adminRentalReservation.customer.name)
                            .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                            .foregroundStyle(.white)
                    }
                    
                    HStack(alignment: .center, spacing: 4) {
                        Text(L10n.customerSurname)
                            .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                            .foregroundStyle(.white)
                        Text(adminRentalReservation.customer.surname)
                            .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                            .foregroundStyle(.white)
                    }
                    
                    HStack(alignment: .center, spacing: 4) {
                        Text(L10n.customerPhoneNo)
                            .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                            .foregroundStyle(.white)
                        Text(adminRentalReservation.customer.phoneNo ?? "")
                            .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                            .foregroundStyle(.white)
                    }
                    
                    HStack(alignment: .center, spacing: 4) {
                        Text(L10n.customerEmail)
                            .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                            .foregroundStyle(.white)
                        Text(adminRentalReservation.customer.email ?? "")
                            .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                            .foregroundStyle(.white)
                    }
                    
                    if let driverLicenceNo = adminRentalReservation.customer.driverLicenceNo {
                        HStack(alignment:.center , spacing: 4) {
                            Text(L10n.driverLicenceNo)
                                .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                                .foregroundStyle(.white)
                            Text(driverLicenceNo)
                                .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                                .foregroundStyle(.white)
                        }
                        
                    }
                
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.white)
                    
                    HStack(alignment:.center , spacing: 4) {
                        Text(L10n.pickupLocation)
                            .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                            .foregroundStyle(.white)
                        Text(adminRentalReservation.pickupLocation.definition)
                            .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                            .foregroundStyle(.white)
                    }
                    
                    HStack(alignment:.center , spacing: 4) {
                        Text(L10n.dropOffLocation)
                            .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                            .foregroundStyle(.white)
                        Text(adminRentalReservation.dropoffLocation.definition)
                            .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                            .foregroundStyle(.white)
                    }
        
                }.frame(maxWidth: .infinity)
                 .background(Asset.Colors.primaryColor.swiftUIColor)
                 .clipShape(RoundedRectangle(cornerRadius: 10))
                 .padding(8)
                
                VStack {
                    
                    HStack(alignment:.center , spacing: 4) {
                        Text(L10n.totalRentPrice)
                            .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                            .foregroundStyle(Asset.Colors.blackColor.swiftUIColor)
                        Text(adminRentalReservation.totalPrice + (adminRentalReservation.currencyTypeAbbreviation ?? ""))
                            .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                            .foregroundStyle(Asset.Colors.blackColor.swiftUIColor)
                    }
                }.frame(maxWidth: .infinity)
                .background(Asset.Colors.lightGreenColor.swiftUIColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(8)
            }
        }.screenBackground(with: .white)
        .toolbar(.hidden, for: .tabBar)
        .edgesIgnoringSafeArea(.top)
    }
}

