//
//  AdminCarRentalsViewModel.swift
//  
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Base
import Helpers
import Domain

final class AdminRentalReservationViewModel: BaseViewModel, ObservableObject {
    @Published var imageUrl: String = ""
    @Published var adminUserName: String = ""
    @Published var adminLastName: String = ""

    
    func prepareHeaderDataView(adminProfile: AdminMainProfile?) {
        self.imageUrl = Constants.imageBaseUrl + (adminProfile?.profile_image ?? "")
        self.adminUserName = adminProfile?.firstname ?? ""
        self.adminLastName = adminProfile?.lastname ?? ""
    }
    
    func fetchRentals() async throws {
        
    }
}
