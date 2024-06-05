//
//  AdminProfileAbilitiesResponse.swift
//  
//
//  Created by Serhan Khan on 25/03/2024.
//

import Foundation
import Network
import Domain

struct AdminProfileAbilitiesResponse: Decodable {
    let me: AdminMeAbilitiesResponse
}

struct AdminMeAbilitiesResponse: Decodable {
    let read: Bool
    let update: Bool
}
