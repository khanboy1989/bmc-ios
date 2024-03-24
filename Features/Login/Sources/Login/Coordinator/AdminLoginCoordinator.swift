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

public struct AdminLoginCoordinator: View {
    
    @EnvironmentObject private var router: Router
    private let dependecies: Dependecies
    
    public init(dependecies: Dependecies) {
        self.dependecies = dependecies
    }
    
    public var body: some View {
        AdminLoginView(dependecies: .init(authenticationRepository: AuthenticationRepository(networkClient: dependecies.networkClient, keyChainService: dependecies.keychainService, userDefaults: dependecies.userDefaults)))
    }
}

public extension AdminLoginCoordinator {
    struct Dependecies {
        let networkClient: INetworkClient
        let keychainService: IKeychainService
        let userDefaults: IUserDefaultsService
        
        public init(networkClient: INetworkClient, keyChainService: IKeychainService, userDefaults: IUserDefaultsService) {
            self.networkClient = networkClient
            self.keychainService = keyChainService
            self.userDefaults = userDefaults
        }
    }
}
