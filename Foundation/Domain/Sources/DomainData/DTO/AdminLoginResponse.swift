//
//  AdminLoginResponse.swift
//
//
//  Created by Serhan Khan on 17/03/2024.
//

import Foundation
import Network
import Domain

struct AdminProfileMapper: Mappable {
    func map(_ input: AdminLoginResponse) throws -> AdminProfile {
        return try AdminLoginResponseMapper().map(input)
    }
}

struct ProfileResponse: Decodable {
    let token: String
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey  {
        case refreshToken = "refresh_token"
        case token
    }
}

struct AdminLoginResponse: Decodable {
    let message: String
    let success: Bool
    let profile: ProfileResponse
    
    enum CodingKeys: String, CodingKey  {
        case message
        case success
        case profile = "data"
    }
}

struct AdminLoginResponseMapper: Mappable {
    func map(_ input: AdminLoginResponse) throws -> AdminProfile {
        .init(token: input.profile.token, refreshToken: input.profile.refreshToken, success: input.success, message: input.message)
    }
}
