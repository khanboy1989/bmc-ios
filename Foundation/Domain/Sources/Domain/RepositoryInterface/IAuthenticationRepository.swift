//
//  IAuthenticationRepository.swift
//  
//
//  Created by Serhan Khan on 11/03/2024.
//

import Foundation


public protocol IAuthenticationRepository {
    func login(email: String, password: String) async throws -> AdminAuth
    func storeAuth(adminAuth: AdminAuth, for key: String) throws -> Bool
    func loadAuth(for key: String) -> AdminAuth? 
}
