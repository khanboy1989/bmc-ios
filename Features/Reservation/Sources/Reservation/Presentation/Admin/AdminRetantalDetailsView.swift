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
                    //Car Information
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
                    //Customer Information
                    Text(L10n.customerInformation)
                        .font(FontFamily.SFPro.bold.swiftUIFont(fixedSize: 16))
                        .foregroundStyle(.white)
                        .padding(2)
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.white)
                    
                    RentalReservationDetailCardView(title: L10n.customerName, value: adminRentalReservation.customer.name, font: FontFamily.SFPro.medium.swiftUIFont(size: 16), textColor: .white)
                    
                    RentalReservationDetailCardView(title: L10n.customerSurname, value: adminRentalReservation.customer.surname, font: FontFamily.SFPro.medium.swiftUIFont(size: 16), textColor: .white)
                    
                    RentalReservationDetailCardView(title: L10n.customerPhoneNo, value: adminRentalReservation.customer.phoneNo ?? "", font: FontFamily.SFPro.medium.swiftUIFont(size: 16), textColor: .white)
                    
                    RentalReservationDetailCardView(title: L10n.customerEmail, value: adminRentalReservation.customer.email ?? "", font: FontFamily.SFPro.medium.swiftUIFont(size: 16), textColor: .white)
                    
                    if let driverLicenceNo = adminRentalReservation.customer.driverLicenceNo {
                        RentalReservationDetailCardView(title: L10n.driverLicenceNo, value: driverLicenceNo, font: FontFamily.SFPro.medium.swiftUIFont(size: 16), textColor: .white)
                    }
                
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.white)
        
                }.frame(maxWidth: .infinity)
                 .background(Asset.Colors.primaryColor.swiftUIColor)
                 .clipShape(RoundedRectangle(cornerRadius: 10))
                 .padding(4)
                
                VStack {
                    //Rental Information
                    Text(L10n.rentalInformation)
                        .font(FontFamily.SFPro.bold.swiftUIFont(fixedSize: 16))
                        .padding(2)
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.black)
                
                    RentalReservationDetailCardView(title: L10n.totalRentPrice, value: adminRentalReservation.totalPrice + (adminRentalReservation.currencySymbol), font: FontFamily.SFPro.medium.swiftUIFont(size: 16), textColor: Asset.Colors.blackColor.swiftUIColor)
                    
                    RentalReservationDetailCardView(title: L10n.pickupLocation, value: adminRentalReservation.pickupLocation.definition, font: FontFamily.SFPro.medium.swiftUIFont(size: 16), textColor: Asset.Colors.blackColor.swiftUIColor)
                    
                    RentalReservationDetailCardView(title: L10n.dropOffLocation, value: adminRentalReservation.dropoffLocation.definition, font: FontFamily.SFPro.medium.swiftUIFont(size: 16), textColor: Asset.Colors.blackColor.swiftUIColor)
                    
                }.frame(maxWidth: .infinity)
                .background(Asset.Colors.lightGreenColor.swiftUIColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(4)
            
                VStack {
                    Text(L10n.journeyDetails)
                        .font(FontFamily.SFPro.bold.swiftUIFont(fixedSize: 16))
                        .padding(2)
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.black)
                    
                    if let flightNo = adminRentalReservation.flightNo {
                        RentalReservationDetailCardView(title: L10n.flightNumber, value: flightNo, font: FontFamily.SFPro.medium.swiftUIFont(size: 16), textColor: Asset.Colors.blackColor.swiftUIColor)
                    }
                    
                    if let imoNo = adminRentalReservation.imo {
                        RentalReservationDetailCardView(title: L10n.imoNumber, value: imoNo, font: FontFamily.SFPro.medium.swiftUIFont(size: 16), textColor: Asset.Colors.blackColor.swiftUIColor)
                    }
                    
                }.frame(maxWidth: .infinity)
                .background(Asset.Colors.powderBlue.swiftUIColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(4)
                
                VStack {
                    Text(L10n.paymentStatus)
                        .font(FontFamily.SFPro.bold.swiftUIFont(fixedSize: 16))
                        .padding(2)
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.black)
                    
                    Text(adminRentalReservation.paymentStatus)
                        .font(FontFamily.SFPro.bold.swiftUIFont(fixedSize: 16))
                        .foregroundStyle(Color.black)
                    
                }.frame(maxWidth: .infinity)
                .background(Asset.Colors.lightGreenColor.swiftUIColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(4)
                
//                ForEach(adminRentalReservation.extraServices, id: \.id) { item in
//                    if let currentLnaguage = Locale.current.language.languageCode?.identifier {
//                        
//                    }
//                }
            }
        }.screenBackground(with: .white)
        .toolbar(.hidden, for: .tabBar)
        .edgesIgnoringSafeArea(.top)
    }
}

