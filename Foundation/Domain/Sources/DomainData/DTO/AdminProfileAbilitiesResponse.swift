//
//  AdminProfileAbilitiesResponse.swift
//  
//
//  Created by Serhan Khan on 25/03/2024.
//

import Foundation

struct AdminProfileAbilitiesResponse: Decodable {
    let me: AdminMeAbilitiesResponse
}

struct AdminMeAbilitiesResponse: Decodable {
    let write: Bool
    let read: Bool
}
