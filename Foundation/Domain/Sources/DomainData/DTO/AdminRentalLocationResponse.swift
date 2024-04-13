//
//  AdminRentalLocation.swift
//
//
//  Created by Serhan Khan on 13/04/2024.
//

import Foundation

struct AdminRentalLocationResponse: Decodable {
    
    let id: Int
    let definitionTR: String
    let deletedAt: String?
    let transferCost: String
    let definitionEN: String
    let taxiCost: String
    let createdAt: String
    let updatedAt: String
    let isTransportationOnly: Int
    let definition: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case definitionTR = "definition_tr"
        case deletedAt = "deleted_at"
        case transferCost = "transfer_cost"
        case definitionEN = "definition_en"
        case taxiCost = "taxi_cost"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case isTransportationOnly = "is_transportation_only"
        case definition = "definition"
    }
}
