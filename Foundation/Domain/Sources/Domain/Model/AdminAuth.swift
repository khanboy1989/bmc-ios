//
//  AdminProfile.swift
//
//
//  Created by Serhan Khan on 17/03/2024.
//

import Foundation
import HelperMacros

@DefaultInit
public struct AdminAuth: Equatable, Codable {
    public let token: String
    public let refreshToken: String
    
    enum CodingKeys: CodingKey {
        case token
        case refreshToken
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.token, forKey: .token)
        try container.encode(self.refreshToken, forKey: .refreshToken)
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.token = try container.decode(String.self, forKey: .token)
        self.refreshToken = try container.decode(String.self, forKey: .refreshToken)
    }
}
