//
//  LoginCoordinator.swift
//  Bmc
//
//  Created by Serhan Khan on 10/03/2024.
//

import SwiftUI
import Router
import Login

struct LoginCoordinator: View {
    @ObservedObject private var router = Router()
//    @EnvironmentObject private var configuration: Configuration
    @State var email: String
    @State var password: String
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            LoginView(image: Asset.Images.splashLogo.swiftUIImage, email: email , password: password, buttonTitle: L10n.login, buttonBackground: Asset.Colors.primaryColor.swiftUIColor, title: L10n.login, emailPlaceHolder: L10n.email, passwordPlaceHolder: L10n.password)
        }
    }
}

#Preview {
    LoginCoordinator(email: "serhan@test.com", password: "asdf1234")
}
