//
//  LoginView.swift
//
//
//  Created by Serhan Khan on 10/03/2024.
//

import SwiftUI
import CommonUI
import Router

public struct LoginView: View {
    let logo: Image
    let buttonTitle: String
    let buttonBackground: Color
    let title: String
    let emailPlaceHolder: String
    let passwordPlacHolder: String
    
    @EnvironmentObject private var router: Router
    @ObservedObject private var viewModel: LoginViewModel = LoginViewModel()
    
    public init(logo: Image,
                buttonTitle: String,
                buttonBackground: Color,
                title: String,
                emailPlaceHolder: String,
                passwordPlaceHolder: String) {
        self.logo = logo
        self.buttonTitle = buttonTitle
        self.buttonBackground = buttonBackground
        self.title = title
        self.emailPlaceHolder = emailPlaceHolder
        self.passwordPlacHolder = passwordPlaceHolder
    }
    
    public var body: some View {
        LoginFormView(logo: logo,
                      email: $viewModel.email,
                      password: $viewModel.password,
                      buttonTitle: buttonTitle,
                      buttonBackground: buttonBackground,
                      title: title,
                      emailPlaceHolder: emailPlaceHolder,
                      passwordPlaceHolder: passwordPlacHolder,
                      loginAction: {
            viewModel.login()
            router.navigate(to: LoginDestination.main)
        })
    }
}


