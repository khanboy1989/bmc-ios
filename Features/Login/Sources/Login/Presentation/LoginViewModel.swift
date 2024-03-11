//
//  File.swift
//  
//
//  Created by Serhan Khan on 10/03/2024.
//

import Foundation
import Helpers
import Domain

@MainActor
final class LoginViewModel: ObservableObject {
    
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
    
    private let authenticationRepository: IAuthenticationRepository
    
    func login()  {
        self.isLoading = true 
        Task {
            do {
                let result = try await self.authenticationRepository.login(email: email, password: password)
                print("Logging in with email: \(email) and password: \(password), result = \(result)")
                self.isLoading = false
            }catch {
                print("Logging in with email: \(email) and password: \(password), result = \(error.localizedDescription)")
                self.isLoading = false
            }
        }
       
    }
    
    func validateEmail() {
        isValidEmail = email.isValidEmail
    }
    
}
