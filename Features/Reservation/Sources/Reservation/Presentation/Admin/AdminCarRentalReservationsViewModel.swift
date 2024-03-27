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
    @Binding private var adminProfile: AdminMainProfile?
    
    init(adminMainProfile: Binding<AdminMainProfile?>) {
        _adminProfile = adminMainProfile
    }
    
    func createImageUrl() -> String {
        return Constants.imageBaseUrl + (adminProfile?.profile_image ?? "")
    }
}
