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
import Utilities


// This struct represents the coordinator responsible for handling the admin login flow.
public struct AdminLoginCoordinator: View {
    
    // Injected environment object for router
    @EnvironmentObject private var router: Router
    
    // Dependencies needed for the coordinator
    private let dependecies: Dependencies
    
    // Initializes the coordinator with the provided dependencies
    public init(dependecies: Dependencies) {
        self.dependecies = dependecies
    }
    
    // The body of the coordinator, which displays the admin login view
    public var body: some View {
        // Initializes and presents the admin login view with the provided dependencies
        AdminLoginView(dependecies: .init(authenticationRepository: AuthenticationRepository(networkClient: dependecies.networkClient, keyChainService: dependecies.keychainService, userDefaults: dependecies.userDefaults)))
    }
}

// Extension containing dependencies for the admin login coordinator
public extension AdminLoginCoordinator {
    
    // Struct representing dependencies required for the coordinator
    struct Dependencies {
        // Network client for making network requests
        let networkClient: INetworkClient
        
        // Keychain service for handling secure storage of sensitive information
        let keychainService: IKeychainService
        
        // UserDefaults service for storing user preferences
        let userDefaults: IUserDefaultsService
        
        // Initializes the dependencies with the provided network client, keychain service, and UserDefaults service
        public init(networkClient: INetworkClient, keyChainService: IKeychainService, userDefaults: IUserDefaultsService) {
            self.networkClient = networkClient
            self.keychainService = keyChainService
            self.userDefaults = userDefaults
        }
    }
}

