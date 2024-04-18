//
//  AdminRentalCoordinator.swift
//  
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Router
import Domain
import DomainData

enum AdminRentalReservationDestionation: Hashable {
    case adminCarRentalDetails(adminReservation: AdminRentalReservation)
}

public struct AdminRentalCoordinator: View {
    
    @EnvironmentObject private var router: Router
    @Binding var adminProfile: AdminMainProfile?
    private let dependecise: Dependecies
    
    public init(dependecies: Dependecies ,adminProfile: Binding<AdminMainProfile?>) {
        self.dependecise = dependecies
        _adminProfile = adminProfile
    }
    
    public var body: some View  {
        AdminCarRentalReservationsView(reservationRepository: .init(networkClient: dependecise.networkClient), adminProfile: $adminProfile)
            .navigationDestination(for: AdminRentalReservationDestionation.self) { destionation in
                switch destionation {
                case let .adminCarRentalDetails(item):
                    AdminRetantalDetailsView(adminRentalReservation: item)
                }
            }
    }
}

public extension AdminRentalCoordinator {
    struct Dependecies {
        let networkClient: INetworkClient
        
        public init(networkClient: INetworkClient) {
            self.networkClient = networkClient
        }
    }
}


