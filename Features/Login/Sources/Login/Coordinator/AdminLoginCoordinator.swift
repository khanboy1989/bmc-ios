//
//  AdminLoginCoordinator.swift
//
//
//  Created by Serhan Khan on 10/03/2024.
//

import SwiftUI
import Domain
import DomainData
import Network
import Router
import SystemDesign
import AlertToast
import Utilities

public enum LoginDestination: Hashable {
    case home
}

public struct AdminLoginCoordinator: View {
    
    @EnvironmentObject private var router: Router
    private let dependecies: Dependecies
    
    public init(dependecies: Dependecies) {
        self.dependecies = dependecies
    }
    
    public var body: some View {
        AdminLoginView(dependecies: .init(authenticationRepository: AuthenticationRepository(networkClient: dependecies.networkClient, keyChainService: dependecies.keychainService)))
            .environmentObject(router)
    }
}

public extension AdminLoginCoordinator {
    struct Dependecies {
        let networkClient: INetworkClient
        let keychainService: IKeychainService
        
        public init(networkClient: INetworkClient, keyChainService: IKeychainService) {
            self.networkClient = networkClient
            self.keychainService = keyChainService
        }
    }
}
