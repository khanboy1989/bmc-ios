//
//  AdminLoginViewModel.swift
//  
//
//  Created by Serhan Khan on 10/03/2024.
//

import Foundation
import Helpers
import Domain
import SystemDesign
import Router
import SwiftUI

final class AdminLoginViewModel: ObservableObject {
    
    struct Dependecies {
        let authenticationRepository: IAuthenticationRepository
    }
    
    init(dependecies: Dependecies) {
        self.authenticationRepository = dependecies.authenticationRepository
    }
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isValidEmail: Bool = false
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    @Published var navigateToMain: Bool = false
    
    private let authenticationRepository: IAuthenticationRepository
    
    func login()  {
        
        //Check if email is empty
        guard !email.isEmpty else {
            self.errorMessage = L10n.emailEmptyError
            self.showError = true
            return
        }
        
        //Check if password is empty
        guard !password.isEmpty else {
            self.errorMessage = L10n.passwordFieldEmptyError
            self.showError = true
            return
        }
        
        //Check if email is valid
        guard isValidEmail else { return }
        
        //Start Loading
        self.isLoading = true
        
        Task { @MainActor in
            do {
                let result = try await self.authenticationRepository.login(email: email, password: password)
                switch result.success  {
                case true:
                    self.isLoading = false
                    self.navigateToMain = true
                case false:
                    self.isLoading = false
                    self.errorMessage = result.message
                    self.showError = true
                }
            }catch {
                self.isLoading = false
                self.errorMessage = error.localizedDescription
                self.showError = true
            }
        }
       
    }
    
    func validateEmail() {
        isValidEmail = email.isValidEmail
    }
    
}
