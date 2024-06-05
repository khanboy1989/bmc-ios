//
//  AdminAbilitiesResponse.swift
//
//
//  Created by Serhan Khan on 25/03/2024.
//

import Foundation

struct AdminAbilitiesResponse: Decodable {
    let profile: AdminProfileAbilitiesResponse
    let dashboard: AdminDashboardAbilitiesResponse
    let cars: AdminCarAbilitiesResponse
}


