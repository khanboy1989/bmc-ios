//
//  IReservationRepository.swift
//  
//
//  Created by Serhan Khan on 30/03/2024.
//

import Foundation

public protocol IReservationRepository {
    func fetchRentalReservations() async throws -> [AdminRentalReservation]
    func fetchTransferReservations() async throws -> [AdminRentalReservation]
}
