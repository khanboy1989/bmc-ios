//
//  File.swift
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

public enum LoginDestination: Hashable {
    case main
}

public struct LoginCoordinator: View {
    
    @EnvironmentObject private var router: Router
    private let dependecies: Dependecies
    
    public init(dependecies: Dependecies) {
        self.dependecies = dependecies
    }
    
    public var body: some View {
        LoginView(dependecies: .init(authenticationRepository: AuthenticationRepository(apiClientService: dependecies.apiClient)))
            .environmentObject(router)
    }
}

public extension LoginCoordinator {
    struct Dependecies {
        let apiClient: IAPIClientService
        
        public init(apiClient: IAPIClientService) {
            self.apiClient = apiClient
        }
        
    }
}
