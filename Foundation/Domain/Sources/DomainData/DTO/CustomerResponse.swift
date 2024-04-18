//
//  CustomerResponse.swift
//
//
//  Created by Serhan Khan on 13/04/2024.
//

import Foundation
import Domain

struct CustomerResponse: Decodable {
    let id: Int
    let gender: GenderType
    let image: String
    let firstName: String
    let lastName: String
    let countryPrefixId: Int
    let isBlocked: Int
    let driverLicenceNo: String?
    let dateOfBirth: String
    let companyName: String?
    let phoneVerifiedAt: String?
    let updatedBy: Int?
    let updatedAt: String?
    let customerType: CustomerType
    let countryId: Int
    let email: String
    let phoneNo: String
    let createdAt: String
    let createdBy: Int?
    let emailVerifiedAt: String?
    let deletedAt: String?
    let deletedBy: Int?
    let customerTypeId: Int
    let address: String
    let emailVerificationCode: String?
    let resetPasswordCode: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case gender = "gender_id"
        case image = "profile_image"
        case firstName = "firstname"
        case lastName = "lastname"
        case countryPrefixId = "country_prefix_id"
        case isBlocked = "is_blocked"
        case driverLicenceNo = "driver_license_no"
        case dateOfBirth = "dob"
        case companyName = "company_name"
        case phoneVerifiedAt = "phone_verified_at"
        case updatedBy = "updated_by"
        case updatedAt = "updated_at"
        case customerType = "customer_type"
        case countryId = "country_id"
        case email = "email"
        case phoneNo = "phone_no"
        case createdAt = "created_at"
        case createdBy = "created_by"
        case emailVerifiedAt = "email_verified_at"
        case deletedBy = "deleted_by"
        case deletedAt = "deleted_at"
        case customerTypeId = "customer_type_id"
        case address
        case emailVerificationCode = "email_verification_code"
        case resetPasswordCode = "reset_password_passcode"

    }
}

