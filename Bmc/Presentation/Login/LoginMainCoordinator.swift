//
//  LoginCoordinator.swift
//  Bmc
//
//  Created by Serhan Khan on 10/03/2024.
//

import SwiftUI
import Router
import Login

struct LoginMainCoordinator: View {
    @ObservedObject private var router = Router()
    @EnvironmentObject private var configuration: Configuration

    var body: some View {
        NavigationStack(path: $router.navPath) {
            LoginCoordinator(dependecies: LoginCoordinator.Dependecies.init(logo: Asset.Images.splashLogo.swiftUIImage, 
                                                                            buttonTitle: L10n.login,
                                                                            title: L10n.login, 
                                                                            buttonBackground: Asset.Colors.primaryColor.swiftUIColor,
                                                                            emailPlaceHolder: L10n.email,
                                                                            passwordPlaceHolder: L10n.password,
                                                                            emailInvalidMessage: L10n.emailIsInvalid,
                                                                            emailValidMessage: L10n.emailIsValid,
                                                                            apiClient: configuration.apiClientService))
                .navigationDestination(for: LoginDestination.self) { destination in
                    switch destination {
                    case .main:
                        let _ = print("Instantiate MainCoordinator from here")
                        EmptyView()
                    }
                    
                }
        }.environmentObject(router)
    }
}

#Preview {
    LoginMainCoordinator()
}
