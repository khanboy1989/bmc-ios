//
//  AdminCarAbilitiesResponse.swift
//
//
//  Created by Serhan Khan on 25/03/2024.
//

import Foundation

struct AdminCarAbilitiesResponse: Decodable {
    let fuelType: AdminFuelTypeAbilitiesResponse
}

struct AdminFuelTypeAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}
