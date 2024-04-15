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
    @Published var rentalReservations: [AdminRentalReservation] = []
    @Published var adminProfile: AdminMainProfile?
    
    private let reservationRepository: IReservationRepository
    
    struct Dependecies {
        let reservationRepository: IReservationRepository
    }
    
    init(dependecise: Dependecies) {
        self.reservationRepository = dependecise.reservationRepository
    }
    
    func prepareHeaderDataView(adminProfile: AdminMainProfile?) {
        self.adminProfile = adminProfile
    }
    
    func fetchRentals() {
        Task.delayed(seconds: 0.5, operation: { [weak self] in
            do {
                guard let self = self else { return }
                let reservations = try await self.reservationRepository.fetchRentalReservations()
                await MainActor.run(body: {
                    self.rentalReservations = reservations
                })
            } catch {
                print("error reservations = \(error.localizedDescription)")
            }
        })
    }
}
