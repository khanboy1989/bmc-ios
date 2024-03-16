//
//  LoginView.swift
//
//
//  Created by Serhan Khan on 10/03/2024.
//

import SwiftUI
import Router
import SystemDesign
import AlertToast
import CommonUI

public struct LoginView: View {
    @EnvironmentObject private var router: Router
    @ObservedObject private var viewModel: LoginViewModel
    
    init(dependecies: LoginViewModel.Dependecies) {
        _viewModel = .init(wrappedValue: LoginViewModel(dependecies: dependecies))
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            Asset
                .Images
                .logo
                .swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 103)
                .padding(.top, 40)
            
            Text(L10n.adminLogin)
                .font(FontFamily.SFPro.bold.swiftUIFont(fixedSize: 24))
                .foregroundColor(Asset.Colors.blackColor.swiftUIColor)
                .padding(.vertical, 8)
            
            Spacer()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 4) {
                    // Email text field
                    TextField("", text: $viewModel.email)
                        .placeholder(when: viewModel.email.isEmpty) {
                            Text(L10n.email).foregroundColor(Asset.Colors.darkGrayColor.swiftUIColor)
                        }
                        .foregroundColor(Asset.Colors.blackColor.swiftUIColor)
                        .padding()
                        .background(Asset.Colors.lightGrayColor.swiftUIColor)
                        .cornerRadius(10)
                        .onChange(of: viewModel.email, perform: { newValue in
                            viewModel.validateEmail()
                        })
                    
                    // Show email validation status
                    Text(viewModel.isValidEmail ? L10n.emailIsInvalid : L10n.emailIsInvalid)
                        .padding(.horizontal)
                        .foregroundColor(viewModel.isValidEmail ? .green : .red)
                        .opacity(viewModel.email.isEmpty ? 0 : 1)
                    
                }
                
                // Password secure field
                SecureField(L10n.password, text: $viewModel.password)
                    .padding()
                    .background(Asset.Colors.lightGrayColor.swiftUIColor)
                    .cornerRadius(10)
            }
            Spacer()
            
            // Login button
            Button(action: {
                viewModel.login()
            }) {
                Text(L10n.login)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Asset.Colors.primaryColor.swiftUIColor)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            Spacer()
        }
        .padding(.horizontal, 16)
        .screenBackground(with: Color.white)
        .toast(isPresenting: $viewModel.isLoading, tapToDismiss: false) {
            //When using loading, duration won't auto dismiss and tapToDismiss is set to false
            AlertToast(type: .loading)
        }
        .toast(isPresenting: $viewModel.showError, duration: 3.0) {
            AlertToast(displayMode:.banner(.pop), type: .error(Color.red), title: viewModel.errorMessage)
        }
        .onChange(of: viewModel.navigateToMain, perform: { isAllowedToNavigate in
            if isAllowedToNavigate {
                router.navigate(to: LoginDestination.main)
            }
        })
    }
}


