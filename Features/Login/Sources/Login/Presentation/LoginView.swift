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
    let emailValidMessage: String
    let emailInvalidMessage: String
    
    @EnvironmentObject private var router: Router
    @ObservedObject private var viewModel: LoginViewModel = LoginViewModel()
    
    public init(logo: Image,
                buttonTitle: String,
                buttonBackground: Color,
                title: String,
                emailPlaceHolder: String,
                passwordPlaceHolder: String,
                emailValidMessage: String,
                emailInvalidMessage: String
    
    ) {
        self.logo = logo
        self.buttonTitle = buttonTitle
        self.buttonBackground = buttonBackground
        self.title = title
        self.emailPlaceHolder = emailPlaceHolder
        self.passwordPlacHolder = passwordPlaceHolder
        self.emailValidMessage = emailValidMessage
        self.emailInvalidMessage = emailInvalidMessage
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            logo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 103)
                .padding(.top, 40)
            
            Text(title)
                .font(.title2)
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Spacer()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 4) {
                    // Email text field
                    TextField(emailPlaceHolder, text: $viewModel.email)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .onChange(of: viewModel.email, perform: { newValue in
                            viewModel.validateEmail()
                        })
                    
                    // Show email validation status
                    Text(viewModel.isValidEmail ? emailValidMessage : emailInvalidMessage)
                        .foregroundColor(viewModel.isValidEmail ? .green : .red)
                        .opacity(viewModel.email.isEmpty ? 0 : 1)
                        
                }
                
                // Password secure field
                SecureField(passwordPlacHolder, text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            
            
            Spacer()
            
            // Login button
            Button(action: {
                viewModel.login()
            }) {
                Text(buttonTitle)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(buttonBackground)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}


