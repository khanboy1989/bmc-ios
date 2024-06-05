//
//  GenderResponse.swift
//
//
//  Created by Serhan Khan on 05.06.24.
//

import Foundation

struct GenderResponse: Decodable {
    let id: Int
    let definitionEN: String
    let definitionTR: String
    let createdAt: String?
    let updatedAt: String?
    let definition: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case definitionEN = "definition_en"
        case definitionTR = "definition_tr"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case definition
    }
}
