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
    @Published var adminProfile: AdminMainProfile? {
        didSet {
            createImageUrl()
        }
    }

    func createImageUrl() {
        self.imageUrl = Constants.imageBaseUrl + (adminProfile?.profile_image ?? "")
        self.adminUserName = adminProfile?.firstname ?? ""
        print("imageUrl from viewModel =\(self.imageUrl)")
    }
}
