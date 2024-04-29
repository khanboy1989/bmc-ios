//
//  AdminRentalExtraServicesResponse.swift
//
//
//  Created by Serhan Khan on 29/04/2024.
//

import Foundation
import Network
import Domain

struct AdminRentalExtraServicesResponse: Decodable {
    let id: Int?
    let createdAt: String?
    let definitionTR: String?
    let definitionEN: String?
    let createdBy: Int?
    let deletedAt: String?
    let price: String?
    let deletedBy: String?
    let image: String?
    let updatedAt: String?
    let calculationType: String?
    let updatedBy: Int?
    let definition: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case definitionTR = "definition_tr"
        case createdBy = "created_by"
        case definitionEN = "definition_en"
        case deletedAt = "deleted_at"
        case price
        case deletedBy = "deleted_by"
        case image = "image"
        case updatedAt = "updated_at"
        case calculationType = "calculation_type"
        case updatedBy = "updated_by"
        case definition = "definition"
    }
}

struct AdminRentalExtraServicesResponseMapper: Mappable {
 
    func map(_ input: AdminRentalExtraServicesResponse) throws -> AdminRentalExtraServices {
        return  AdminRentalExtraServices(id: input.id, createdAt: input.createdAt, definitionTR: input.definitionTR, definitionEN: input.definitionEN, createdBy: input.createdBy, deletedAt: input.deletedAt, price: input.price, deletedBy: input.deletedBy, image: input.image, updatedAt: input.updatedAt, calculationType: input.calculationType, updatedBy: input.updatedBy, definition: input.definition)
    }
}
