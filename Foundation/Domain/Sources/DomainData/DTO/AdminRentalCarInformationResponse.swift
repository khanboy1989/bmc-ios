//
//  AdminRentalCarInformationResponse.swift
//
//
//  Created by Serhan Khan on 14/04/2024.
//

import Foundation

struct AdminRentalCarInformationResponse: Decodable {
    let id: Int
    let gearType: GearTypeResponse
    let color: String
    let gearTypeId: Int
    let image: String
    let colorEN: String
    let colorTR: String
    let updatedAt: String?
    let numberOfPassengers: Int
    let createdAt: String
    let updatedBy: Int?
    let deletedAt: String?
    let enginePower: Int
    let year: String
    let plate: String
    let details: String
    let carModelId: Int
    let isTransportationOnly: Int
    let fuelTypeId: Int
    let doorCount: Int
    let deletedBy: Int?
    let carTypeId: Int
    let carSizeId: Int
    let createdBy: Int?
    let carClassId: Int
    let isAvailable: Int
    let discountRate: Int?
    let carSize: CarSizeResponse
    let carClass: CarClassResponse
    let fuelType: FuelTypeResponse
    let carModel: CarModelResponse
    let carType: CarTypeResponse
    
    enum CodingKeys: String, CodingKey {
        case id
        case gearType = "gear_type"
        case color
        case gearTypeId = "gear_type_id"
        case image
        case colorEN = "color_en"
        case colorTR = "color_tr"
        case updatedAt = "updated_at"
        case numberOfPassengers = "passenger_count"
        case createdAt = "created_at"
        case updatedBy = "updated_by"
        case deletedAt = "deleted_at"
        case enginePower = "engine_power"
        case year
        case plate
        case details
        case carModelId = "car_model_id"
        case isTransportationOnly = "is_transportation_only"
        case fuelTypeId = "fuel_type_id"
        case doorCount = "door_count"
        case deletedBy = "deleted_by"
        case carTypeId = "car_type_id"
        case carSizeId = "car_size_id"
        case createdBy = "created_by"
        case carClassId = "car_class_id"
        case isAvailable = "is_available"
        case discountRate = "discount_rate"
        case carSize = "car_size"
        case carClass = "car_class"
        case fuelType = "fuel_type"
        case carModel = "car_model"
        case carType = "car_type"
    }
}

struct GearTypeResponse: Decodable {
    let id: Int
    let createdBy: Int?
    let deletedBy: Int?
    let updatedBy: Int?
    let definitionEN: String
    let definitionTR: String
    let createdAt: String
    let deletedAt: String?
    let updatedAt: String?
    let definition: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdBy = "created_by"
        case deletedBy = "deleted_by"
        case definitionEN = "definition_en"
        case definitionTR = "definition_tr"
        case updatedBy = "updated_by"
        case createdAt = "created_at"
        case deletedAt = "deleted_at"
        case updatedAt = "updated_at"
        case definition = "definition"
    }
}

struct CarSizeResponse: Decodable {
    let id: Int
    let definitionTR: String
    let definitionEN: String
    let createdBy: Int?
    let deletedBy: Int?
    let updatedBy: Int?
    let createdAt: String
    let deletedAt: String?
    let updatedAt: String?
    let definition: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case definitionTR = "definition_tr"
        case definitionEN = "definition_en"
        case createdBy = "created_by"
        case deletedBy = "deleted_by"
        case updatedBy = "updated_by"
        case createdAt = "created_at"
        case deletedAt = "deleted_at"
        case updatedAt = "updated_at"
        case definition
    }
}

struct CarClassResponse: Decodable {
    let id: Int
    let definitionTR: String
    let definitionEN: String
    let createdBy: Int?
    let deletedBy: Int?
    let createdAt: String
    let updatedBy: Int?
    let deletedAt: String?
    let updatedAt: String?
    let definition: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case definitionTR = "definition_tr"
        case definitionEN = "definition_en"
        case createdBy = "created_by"
        case deletedBy = "deleted_by"
        case createdAt = "created_at"
        case updatedBy = "updated_by"
        case deletedAt = "deleted_at"
        case updatedAt = "updated_at"
        case definition
    }
}

struct CarModelResponse: Decodable {
    let id: Int
    let createdBy: Int?
    let deletedBy: Int?
    let createdAt: String
    let updatedBy: Int?
    let deletedAt: String?
    let updatedAt: String?
    let name: String
    let carBrandId: Int
    let carBrand: CarBrandResponse
    let carPrice: CarPriceResponse?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdBy = "created_by"
        case deletedBy = "deleted_by"
        case createdAt = "created_at"
        case updatedBy = "updated_by"
        case deletedAt = "deleted_at"
        case updatedAt = "updated_at"
        case name
        case carBrandId = "car_brand_id"
        case carBrand = "car_brand"
        case carPrice = "car_price"
       
    }
}

struct CarBrandResponse: Decodable {
    let id: Int
    let createdBy: Int?
    let deletedBy: Int?
    let createdAt: String
    let updatedBy: Int?
    let updatedAt: String?
    let deletedAt: String?
    let name: String
    let logo: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdBy = "created_by"
        case deletedBy = "deleted_by"
        case createdAt = "created_at"
        case updatedBy = "updated_by"
        case deletedAt = "deleted_at"
        case updatedAt = "updated_at"
        case name
        case logo
    }
}

struct CarPriceResponse: Decodable {
    let id: Int
    let dailyPrice: Int
    let monthlyPrice: Int
    let yearlyPrice: Int
    let weeklyPrice: Int
    let createdAt: String
    let createdBy: Int?
    let deletedAt: String?
    let deletedBy: Int?
    let carModelId: Int
    let updatedAt: String?
    let updatedBy: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case dailyPrice = "daily_price"
        case monthlyPrice = "monthly_price"
        case yearlyPrice = "yearly_price"
        case weeklyPrice = "weekly_price"
        case createdAt = "created_at"
        case createdBy = "created_by"
        case deletedAt = "deleted_at"
        case deletedBy = "deleted_by"
        case carModelId = "car_model_id"
        case updatedAt = "updated_at"
        case updatedBy = "updated_by"
    }
}

struct FuelTypeResponse: Decodable {
    let id: Int
    let definitionTR: String
    let definitionEN: String
    let createdBy: Int?
    let deletedBy: Int?
    let createdAt: String
    let updatedBy: Int?
    let deletedAt: String?
    let updatedAt: String?
    let definition: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case definitionTR = "definition_tr"
        case definitionEN = "definition_en"
        case createdBy = "created_by"
        case deletedBy = "deleted_by"
        case createdAt = "created_at"
        case updatedBy = "updated_by"
        case definition
        case deletedAt = "deleted_at"
        case updatedAt = "updated_at"
    }
}

struct CarTypeResponse: Decodable {
    let id: Int
    let definitionTR: String
    let definitionEN: String
    let definition: String
    let createdBy: Int?
    let deletedBy: Int?
    let createdAt: String
    let updatedBy: Int?
    let deletedAt: String?
    let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case definitionTR = "definition_tr"
        case definitionEN = "definition_en"
        case definition
        case createdBy = "created_by"
        case deletedBy = "deleted_by"
        case createdAt = "created_at"
        case updatedBy = "updated_by"
        case deletedAt = "deleted_at"
        case updatedAt = "updated_at"
    }
}
