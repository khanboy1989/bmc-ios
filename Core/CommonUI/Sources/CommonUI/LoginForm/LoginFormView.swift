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
    
    @Binding var email: String
    @Binding var password: String
    
    
    public init(logo: Image,
                email: Binding<String>,
                password: Binding<String>,
                buttonTitle: String,
                buttonBackground: Color,
                title: String,
                emailPlaceHolder: String,
                passwordPlaceHolder: String
    ) {
        self.logo = logo
        self._email = email
        self._password = password
        self.buttonTitle = buttonTitle
        self.buttonBackground = buttonBackground
        self.emailPlaceHolder = emailPlaceHolder
        self.passwordPlaceHolder = passwordPlaceHolder
        self.title = title
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            logo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 150)
                .padding(.top, 50)
            
            Text(title)
                .font(.title2)
                .fontWeight(.medium)
                .padding(.vertical, 8)
                
            
            Spacer()
            
            VStack(spacing: 8) {
                
                // Email text field
                TextField(emailPlaceHolder, text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // Password secure field
                SecureField(passwordPlaceHolder, text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }.padding(.horizontal, 16)
            
            
            Spacer()
            
            // Login button
            Button(action: {
                
            }) {
                Text(buttonTitle)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(buttonBackground)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.top, 20)
            .padding(.horizontal, 16)
            
            Spacer()
        }
    }
}
