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
    @Published var isLoading: Bool = true
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
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
                await MainActor.run(body: {
                    self.isLoading = true
                })
                let reservations = try await self.reservationRepository.fetchRentalReservations().filter {$0.isArchived == false}
                await MainActor.run(body: {
                    self.rentalReservations = reservations
                    self.isLoading = false
                })
                
            } catch {
                await MainActor.run(body: { [weak self] in 
                    self?.errorMessage = error.localizedDescription
                    self?.showError = true
                    self?.isLoading = false
                })
                
            }
        })
    }
    
    func refreshRentals() {
        Task {
            do {
                let reservations = try await self.reservationRepository.fetchRentalReservations().filter {$0.isArchived == false}
                await MainActor.run(body: {
                    self.rentalReservations = reservations
                })
            } catch {
                errorMessage = error.localizedDescription
                self.showError = true
            }
        }
    }
}
