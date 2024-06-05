//
//  CountryPrefixResponse.swift
//
//
//  Created by Serhan Khan on 05.06.24.
//

import Foundation

struct CountryResponse: Decodable {
    let id: Int
    let titleEN: String
    let titleTR: String
    let createdAt: String?
    let updatedAt: String?
    let title: String
    
    enum CodingKeys:String, CodingKey {
        case id
        case titleEN = "title_en"
        case titleTR = "title_tr"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case title
    }
}
struct CountryPrefixResponse: Decodable {
    let id: Int
    let countryId: Int
    let countryCode: String
    let createdAt: String?
    let updatedAt: String?
    let isoCode: String
    let country: CountryResponse
    enum CodingKeys:String, CodingKey {
        case id
        case countryId = "country_id"
        case countryCode = "country_code"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case isoCode = "iso_code"
        case country
    }

}
