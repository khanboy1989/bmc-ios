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
    
    public init(networkClient: INetworkClient) {
        self.networkClient = networkClient
    }
    
    public func fetchRentalReservations() async throws -> [AdminRentalReservation] {
        do {
            let result = try await self.networkClient.request(AdminApiEndpoints.rentalReservations(), mapper: AdminRentalReservationDataWrapperResponseMapper())
            return result
        } catch {
            throw error
        }
    }
    
    public func fetchTransferReservations() async throws -> [AdminRentalReservation] {
        do {
            let result = try await self.networkClient.request(AdminApiEndpoints.transferReservations(), mapper: AdminRentalReservationDataWrapperResponseMapper())
            return result
        } catch {
            throw error
        }
    }
}
