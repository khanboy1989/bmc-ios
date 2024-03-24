//
//  AdminLoginView.swift
//
//
//  Created by Serhan Khan on 10/03/2024.
//

import SwiftUI
import Router
import SystemDesign
import AlertToast
import CommonUI
import Combine

public struct AdminLoginView: View {
    @EnvironmentObject private var router: Router
    @ObservedObject private var viewModel: AdminLoginViewModel
    @StateObject private var keyboardObserver = KeyboardObserver()
    @State private var keyboardOffset: CGFloat = 0
    
    init(dependecies: AdminLoginViewModel.Dependecies) {
        _viewModel = .init(wrappedValue: AdminLoginViewModel(dependecies: dependecies))
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
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
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
                        .font(FontFamily.SFPro.medium.swiftUIFont(fixedSize: 11))
                        .padding(.horizontal)
                        .foregroundColor(viewModel.isValidEmail ? .green : .red)
                        .opacity(viewModel.email.isEmpty ? 0 : 1)
                    
                }
                
                // Password secure field
                SecureField("", text: $viewModel.password)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .placeholder(when: viewModel.password.isEmpty) {
                        Text(L10n.password).foregroundColor(Asset.Colors.darkGrayColor.swiftUIColor)
                    }
                    .foregroundColor(Asset.Colors.blackColor.swiftUIColor)
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
            .padding(.bottom, keyboardOffset > 0 ? keyboardOffset : 20)
            
        }
        .padding(.horizontal, 16)
        .screenBackground(with: Asset.Colors.whiteColor.swiftUIColor)
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)) { notification in
                    guard let keyboardRect = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                    withAnimation {
                        keyboardOffset = max(0, keyboardRect.minY - UIScreen.main.bounds.height)
                    }
        }
        .toast(isPresenting: $viewModel.isLoading, tapToDismiss: false) {
            //When using loading, duration won't auto dismiss and tapToDismiss is set to false
            AlertToast(type: .loading)
        }
        .toast(isPresenting: $viewModel.showError, duration: 3.0) {
            AlertToast(displayMode:.banner(.pop), type: .error(Color.red), title: viewModel.errorMessage)
        }
        .onChange(of: viewModel.navigateToMain, perform: { isAllowedToNavigate in
            if isAllowedToNavigate {
                router.navigate(to: LoginDestination.home)
            }
        })
        .onAppear {
            // Register observer when the view appears
            keyboardObserver.keyboardHeight = 0
        }
    }
}


class KeyboardObserver: ObservableObject {
    private var cancellable: AnyCancellable?
    
    @Published var keyboardHeight: CGFloat = 0
    
    init() {
        cancellable = NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .compactMap { notification in
                guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                    return nil
                }
                return frame.height
            }
            .assign(to: \.keyboardHeight, on: self)
    }
}
