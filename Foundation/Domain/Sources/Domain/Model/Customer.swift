//
//  Customer.swift
//
//
//  Created by Serhan Khan on 13/04/2024.
//

import Foundation
import HelperMacros


public struct CustomerType: Decodable {
    let id: Int
    let definitionEN: String
    let definitionTR: String
    let createdAt: String
    let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case definitionEN = "definition_en"
        case definitionTR = "definition_tr"
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
    }
}

@DefaultInit
public struct Customer {
    let profileImage: String
    let name: String
    let surname: String
    let address: String
    let customerType: CustomerType
    let dateOfBirth: String
    let companyName: String?
    let driverLicenceNo: String?
    let countryId: Int
    let countryPrefixId: Int
    let isBlocked: Bool 
}
