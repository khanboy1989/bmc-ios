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
    let definitionTR: String?
    let definitionEN: String?
    let price: String?
    let image: String?
    let calculationType: String?
    let definition: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case definitionTR = "definition_tr"
        case definitionEN = "definition_en"
        case price
        case image = "image"
        case calculationType = "calculation_type"
        case definition = "definition"
    }
}

struct AdminRentalExtraServicesResponseMapper: Mappable {
    func map(_ input: AdminRentalExtraServicesResponse) throws -> AdminRentalExtraServices {
        return  AdminRentalExtraServices(id: input.id, definitionTR: input.definitionTR, definitionEN: input.definitionEN, price: input.price,image: input.image, calculationType: input.calculationType, definition: input.definition)
    }
}
