//
//  File.swift
//  
//
//  Created by Serhan Khan on 10/03/2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() {
        print("Logging in with email: \(email) and password: \(password)")
    }
    
}
