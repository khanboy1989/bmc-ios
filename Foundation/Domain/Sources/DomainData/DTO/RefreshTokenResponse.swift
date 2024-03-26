//
//  RefreshTokenResponse.swift
//
//
//  Created by Serhan Khan on 25/03/2024.
//

import Foundation
import Network
import Domain

struct RefreshTokenMapper: Mappable {
    func map(_ input: RefreshTokenResponseDataWrapper) throws -> AdminAuth {
        return try RefreshTokenResponseMapper().map(input)
    }
}

struct RefreshTokenResponse: Decodable {
    
    let token: String
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case token
        case refreshToken = "refresh_token"
    }
}

struct RefreshTokenWrapper: Decodable {
    let tokens: RefreshTokenResponse
    
    enum CodingKeys: String, CodingKey {
        case tokens = "refresh-token"
    }
}

struct RefreshTokenResponseDataWrapper: Decodable {
    let success: Bool
    let message: String
    let data: RefreshTokenWrapper
}

struct RefreshTokenResponseMapper: Mappable {
    func map(_ input: RefreshTokenResponseDataWrapper) throws -> AdminAuth {
        return .init(token: input.data.tokens.token, refreshToken: input.data.tokens.refreshToken)
    }
}
