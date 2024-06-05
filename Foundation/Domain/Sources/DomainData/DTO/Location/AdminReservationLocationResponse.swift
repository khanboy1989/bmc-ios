//
//  AdminRentalLocationResponse.swift
//
//
//  Created by Serhan Khan on 13/04/2024.
//

import Foundation

struct AdminReservationLocationResponse: Decodable {
    let id: Int
    let definitionTR: String
    let transferCost: String?
    let definitionEN: String
    let taxiCost: String?
    let isTransportationOnly: Int
    let definition: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case definitionTR = "definition_tr"
        case transferCost = "transfer_cost"
        case definitionEN = "definition_en"
        case taxiCost = "taxi_cost"
        case isTransportationOnly = "is_transportation_only"
        case definition = "definition"
    }
}
