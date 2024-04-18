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
    
    public enum CodingKeys: String, CodingKey {
        case definitionEN = "definition_en"
        case definitionTR = "definition_tr"
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
    }
}

@DefaultInit
public struct Customer {
    public let profileImage: String
    public let name: String
    public let surname: String
    public let address: String
    public let customerType: CustomerType
    public let dateOfBirth: String
    public let companyName: String?
    public let driverLicenceNo: String?
    public let countryId: Int
    public let countryPrefixId: Int
    public let isBlocked: Bool
    public let phoneNo: String?
    public let email: String?
}
