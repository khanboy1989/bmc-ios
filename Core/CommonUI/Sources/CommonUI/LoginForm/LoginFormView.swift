//
//  SwiftUIView.swift
//
//
//  Created by Serhan Khan on 10/03/2024.
//

import SwiftUI

public struct LoginFormView: View {
    let logo: Image
    let buttonTitle: String
    let buttonBackground: Color
    let title: String
    let emailPlaceHolder: String
    let passwordPlaceHolder: String
    let emailInvalidMessage: String
    let emailValidMessage: String
    var loginAction: () -> Void
    var validateEmail: () -> Void
    
    @Binding var email: String
    @Binding var password: String
    @Binding var isValidEMail: Bool
    
    public init(logo: Image,
                email: Binding<String>,
                password: Binding<String>,
                isValidEmail: Binding<Bool>,
                buttonTitle: String,
                buttonBackground: Color,
                title: String,
                emailPlaceHolder: String,
                passwordPlaceHolder: String,
                emailValidMessage: String,
                emailInvalidMessage: String,
                loginAction: @escaping () -> Void,
                validateEmail: @escaping () -> Void
    ) {
        self.logo = logo
        self._email = email
        self._password = password
        self._isValidEMail = isValidEmail
        self.buttonTitle = buttonTitle
        self.buttonBackground = buttonBackground
        self.emailPlaceHolder = emailPlaceHolder
        self.passwordPlaceHolder = passwordPlaceHolder
        self.title = title
        self.loginAction = loginAction
        self.validateEmail = validateEmail
        self.emailValidMessage = emailValidMessage
        self.emailInvalidMessage = emailInvalidMessage
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            logo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 150)
                .padding(.top, 40)
            
            Text(title)
                .font(.title2)
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Spacer()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 4) {
                    // Email text field
                    TextField(emailPlaceHolder, text: $email)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .onChange(of: email, perform: { newValue in
                            validateEmail()
                        })
                    
                    // Show email validation status
                    Text(isValidEMail ? emailValidMessage : emailInvalidMessage)
                        .foregroundColor(isValidEMail ? .green : .red)
                        .opacity(email.isEmpty ? 0 : 1)
                        
                }
                
                // Password secure field
                SecureField(passwordPlaceHolder, text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            
            
            Spacer()
            
            // Login button
            Button(action: {
                loginAction()
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
