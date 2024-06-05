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
    let gender: GenderResponse
    let image: String
    let firstName: String
    let lastName: String
    let countryPrefix: CountryPrefixResponse
    let isBlocked: Int
    let driverLicenceNo: String?
    let dateOfBirth: String
    let companyName: String?
    let phoneVerifiedAt: String?
    let customerType: String
    let email: String
    let phoneNo: String
    let emailVerifiedAt: String?
    let address: String
    let emailVerificationCode: String?
    let resetPasswordCode: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case gender
        case image = "profile_image"
        case firstName = "firstname"
        case lastName = "lastname"
        case countryPrefix = "country_prefix"
        case isBlocked = "is_blocked"
        case driverLicenceNo = "driver_license_no"
        case dateOfBirth = "dob"
        case companyName = "company_name"
        case phoneVerifiedAt = "phone_verified_at"
        case customerType = "customer_type"
        case email = "email"
        case phoneNo = "phone_no"
        case emailVerifiedAt = "email_verified_at"
        case address
        case emailVerificationCode = "email_verification_code"
        case resetPasswordCode = "reset_password_passcode"
    }
}


