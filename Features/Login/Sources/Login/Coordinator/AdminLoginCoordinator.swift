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
    case main
}

public struct AdminLoginCoordinator: View {
    
    @EnvironmentObject private var router: Router
    private let dependecies: Dependecies
    
    public init(dependecies: Dependecies) {
        self.dependecies = dependecies
    }
    
    public var body: some View {
        AdminLoginView(dependecies: .init(authenticationRepository: AuthenticationRepository(apiClientService: dependecies.apiClient), keyChianService: dependecies.keychainService))
            .environmentObject(router)
    }
}

public extension AdminLoginCoordinator {
    struct Dependecies {
        let apiClient: IAPIClientService
        let keychainService: IKeychainService
        
        public init(apiClient: IAPIClientService, keyChainService: IKeychainService) {
            self.apiClient = apiClient
            self.keychainService = keyChainService
        }
    }
}
