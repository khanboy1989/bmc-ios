//
//  AdminTranferReservationViewModel.swift
//  
//
//  Created by Serhan Khan on 23/03/2024.
//

import Foundation
import Base
import SwiftUI
import Domain
import Helpers

final class AdminTranferReservationViewModel: BaseViewModel, ObservableObject {
    @Published var adminProfile: AdminMainProfile?
 
    private let reservationRepository: IReservationRepository
    
    struct Dependecies {
        let reservationRepository: IReservationRepository
    }
    
    init(dependecise: Dependecies) {
        self.reservationRepository = dependecise.reservationRepository
    }
    
    func fetchTransfers() {
        Task.delayed(seconds: 0.5, operation: {
            @MainActor [weak self] in
            
            do {
                guard let self = self else { return }
                try await self.reservationRepository.fetchTransferReservations()
            } catch {
                print("Error = \(error.localizedDescription)")
            }
        })
    }
}
