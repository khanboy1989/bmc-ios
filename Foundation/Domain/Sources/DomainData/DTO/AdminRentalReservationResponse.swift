//
//  AdminRentalReservationsResponse.swift
//
//
//  Created by Serhan Khan on 02/04/2024.
//

import Foundation


struct AdminRentalReservationResponse: Decodable {
    let id: Int
    let imo: String
    let isArchieved: Bool
    let colorEn: String
    let colorTr: String
    let finalDailyRentPrice: String
    let gearTypeId: Int
    let image: String
    let updatedBy: Int
    let updatedAt: String
    let enginePower: Int
    let year: String
    let plate: String
    let details: String
    let carModelId: Int
    let isTransportationOnly: Bool
    let fuelTypeId: Int
    let doorCount: Int
    let deletedBy: Int
    let carTypeId: Int
    let carSizeId: Int
    let deletedAt: String?
    let createdBy: Int
    let carClassId: Int
    let createdAt: String
    let realDailyRentPrice: String
    let paymentStatus: String
    let reservationAgreement: Int
    let currencyTypeAbbreviation: String
    let currencySymbol: String
    let endDate: String
    let totalPriceByCurrency: String
    let flightNo: String
    let customerId: Int?
    let currencyTypeDefinition: String
    let paymentMethod: String
    let totalPriceRent: String
    let totalExtraServicePrice: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case imo = "imo_no"
        case isArchieved = "is_archived"
        case colorEn = "color_en"
        case colorTr = "color_tr"
        case finalDailyRentPrice = "final_daily_rent_price"
        case gearTypeId = "gear_type_id"
        case image
        case updatedBy = "updated_by"
        case updatedAt = "updated_at"
        case enginePower = "engine_power"
        case year = "year"
        case plate
        case details
        case carModelId = "car_model_id"
        case isTransportationOnly = "is_transportation_only"
        case fuelTypeId = "fuel_type_id"
        case doorCount = "door_count"
        case deletedBy = "deleted_by"
        case carTypeId = "car_type_id"
        case carSizeId = "car_size_id"
        case deletedAt = "deleted_at"
        case createdBy = "created_by"
        case carClassId = "car_class_id"
        case createdAt = "created_at"
        case realDailyRentPrice = "real_daily_rent_price"
        case paymentStatus = "payment_status"
        case reservationAgreement = "reservation_agreement"
        case currencyTypeAbbreviation = "currency_type_abbreviation"
        case currencySymbol = "currency_symbol"
        case endDate = "end_date"
        case totalPriceByCurrency = "total_price_by_currency"
        case flightNo = "flight_no"
        case customerId = "customer_id"
        case currencyTypeDefinition = "currency_type_definition"
        case paymentMethod = "payment_method"
        case totalRentPrice = "total_rent_price"
        case totalExtraServicePrice = "total_extra_service_price"
    }
}

/*
         "price_type":"14-30 Days",
         "total_price":"291.24",
         "currency_rate":"0.86",
         "start_date":"2024-01-22 00:00:00",
         "created_at":"2024-01-21T20:03:05.000000Z",
         "reservation_status":"Canceled",
         "transfer_cost":"23.31",
         "comment":"sdsds",
         "drop_location":null,
         "address":"dsdsds"
*/
