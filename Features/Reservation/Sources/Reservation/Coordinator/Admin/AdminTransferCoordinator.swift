//
//  AdminTransferCoordinator.swift
//
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Router
import Domain
import DomainData

public struct AdminTransferCoordinator: View {
    
    @EnvironmentObject private var router: Router
    @Binding var adminProfile: AdminMainProfile?
    private let dependecise: Dependecies
    
    public init(dependecies: Dependecies,adminProfile: Binding<AdminMainProfile?>) {
        self.dependecise = dependecies
        _adminProfile = adminProfile
        
    }
    
    public var body: some View  {
        AdminTranferReservationsView(reservationRepository: .init(networkClient: dependecise.networkClient), adminProfile: $adminProfile)
    }
    
}

public extension AdminTransferCoordinator {
    struct Dependecies {
        let networkClient: INetworkClient
        
        public init(networkClient: INetworkClient) {
            self.networkClient = networkClient
        }
    }
}
