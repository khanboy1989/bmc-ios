//
//  ResultResponse.swift
//  
//
//  Created by Serhan Khan on 17/03/2024.
//

import Foundation

struct ResultResponse: Decodable {
    let success: Bool
    let statusMessage: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case statusMessage = "message"
    }
}
