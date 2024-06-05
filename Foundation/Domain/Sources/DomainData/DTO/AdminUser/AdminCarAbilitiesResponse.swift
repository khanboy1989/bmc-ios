//
//  AdminCarAbilitiesResponse.swift
//
//
//  Created by Serhan Khan on 25/03/2024.
//

import Foundation


struct AdminCarAbilitiesResponse: Decodable {
    let fuelType: AdminFuelTypeAbilitiesResponse
    let car: AdminCarOperationsAbilitiesResponse
    let gearType: AdminGearTypeAbilitiesResponse
    let model: AdminModelAbilitiesResponse
    let size: AdminSizeAbilitiesResponse
    let carClass: AdminClassAbilitiesResponse
    let brand: AdminBrandAbilitiesResponse
    let spec: AdminSpecificationAbilitiesResponse
    let carType: AdminTypeAbilitiesResponse
    let price: AdminPriceAbilitiesResponse
    
    enum CodingKeys: String, CodingKey {
        case fuelType
        case car
        case gearType
        case model
        case size
        case carClass = "class"
        case brand
        case spec
        case carType = "type"
        case price
    }
    
}

struct AdminFuelTypeAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

struct AdminCarOperationsAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

struct AdminGearTypeAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

struct AdminModelAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

struct AdminSizeAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

struct AdminClassAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

struct AdminBrandAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

struct AdminSpecificationAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

struct AdminTypeAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

struct AdminPriceAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}
