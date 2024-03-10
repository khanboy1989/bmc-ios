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

public struct LoginCoordinator: View {
    
    @EnvironmentObject private var router: Router
    private let dependecies: Dependecies
    
    public init(dependecies: Dependecies) {
        self.dependecies = dependecies
    }
    
    public var body: some View {
        LoginView(logo: dependecies.logo, buttonTitle: dependecies.buttonTitle, buttonBackground: dependecies.buttonBackground, title: dependecies.title, emailPlaceHolder: dependecies.emailPlaceHolder, passwordPlaceHolder: dependecies.passwordPlaceHolder)
    }
    
    
}

public extension LoginCoordinator {
    struct Dependecies {
        let logo: Image
        let buttonTitle: String
        let title: String
        let buttonBackground: Color
        let emailPlaceHolder: String
        let passwordPlaceHolder: String
        let apiClient: IAPIClientService
        
        public init(logo: Image, buttonTitle: String, title: String, buttonBackground: Color, emailPlaceHolder: String, passwordPlaceHolder: String, apiClient: IAPIClientService) {
            self.logo = logo
            self.buttonTitle = buttonTitle
            self.title = title
            self.buttonBackground = buttonBackground
            self.emailPlaceHolder = emailPlaceHolder
            self.passwordPlaceHolder = passwordPlaceHolder
            self.apiClient = apiClient
        }
        
    }
}
