//
//  ReservationRepository.swift
//
//
//  Created by Serhan Khan on 30/03/2024.
//

import Foundation
import Domain
import Network

public final class ReservationRepository: IReservationRepository {
    private let networkClient: INetworkClient
    
    init(networkClient: INetworkClient) {
        self.networkClient = networkClient
    }
    
    public func fetchRentalReservations() async throws {
        do {
            let result = try await self.networkClient.request(AdminApiEndpoints.rentalReservations(), for: GeneralResult.self)
            
        } catch {
            throw error
        }
    }
    
    
}
