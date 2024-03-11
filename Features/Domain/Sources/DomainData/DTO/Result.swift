//
//  Result.swift
//  
//
//  Created by Serhan Khan on 11/03/2024.
//

import Foundation

struct Result: Decodable {
    let success: Bool
    let statusMessage: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case statusMessage = "message"
    }
}
