//
//  AdminMainTabViewCoordinator.swift
//
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Router
import DomainData
import Utilities

public struct AdminMainTabViewCoordinator: View {

    // Injected environment object for router
    @EnvironmentObject private var router: Router
    
    // Dependencies needed for the coordinator
    private let dependecies: Dependecies
    
    public init(dependecies: Dependecies) {
        self.dependecies = dependecies
    }
    
    public var body: some View {
        AdminTabView(dependecies: .init(profileRepository: ProfileRepository.init(networkClient: dependecies.networkClient, userDefaults: dependecies.userDefaults)))
    }
}

public extension AdminMainTabViewCoordinator {
    
    // Struct for Dependencies
    struct Dependecies {
        // Initializer for Dependencies
        let networkClient: INetworkClient
        
        let userDefaults: IUserDefaultsService
        
        public init(networkClient: INetworkClient, userDefaults: IUserDefaultsService) {
            self.networkClient = networkClient
            self.userDefaults = userDefaults
        }
    }
}
