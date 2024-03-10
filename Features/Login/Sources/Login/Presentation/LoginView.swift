//
//  LoginView.swift
//
//
//  Created by Serhan Khan on 10/03/2024.
//

import SwiftUI
import CommonUI

public struct LoginView: View {
    let image: Image
    let buttonTitle: String
    let buttonBackground: Color
    let title: String
    let emailPlaceHolder: String
    let passwordPlacHolder: String
    
    @State var email: String
    @State var password: String
    
    
    public init(image: Image,
                email: String,
                password: String,
                buttonTitle: String,
                buttonBackground: Color,
                title: String,
                emailPlaceHolder: String,
                passwordPlaceHolder: String) {
        self.image = image
        self.email = email
        self.password = password
        self.buttonTitle = buttonTitle
        self.buttonBackground = buttonBackground
        self.title = title
        self.emailPlaceHolder = emailPlaceHolder
        self.passwordPlacHolder = passwordPlaceHolder
    }
    
    public var body: some View {
        LoginFormView(image: image, 
                      email: email,
                      password: password, 
                      buttonTitle: buttonTitle,
                      buttonBackground: buttonBackground,
                      title: title,
                      emailPlaceHolder: emailPlaceHolder,
                      passwordPlaceHolder: passwordPlacHolder
                      
        )
    }
}


