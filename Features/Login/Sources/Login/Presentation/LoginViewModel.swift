//
//  File.swift
//  
//
//  Created by Serhan Khan on 10/03/2024.
//

import Foundation
import Helpers

final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isValidEmail: Bool = false
    
    
    func login() {
        print("Logging in with email: \(email) and password: \(password)")
    }
    
    func validateEmail() {
        isValidEmail = email.isValidEmail
    }
    
}
