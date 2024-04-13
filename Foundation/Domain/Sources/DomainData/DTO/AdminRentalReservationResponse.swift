//
//  AdminRentalReservationsResponse.swift
//
//
//  Created by Serhan Khan on 02/04/2024.
//

import Foundation
import Network
import Domain


struct AdminRentalReservationDataWrapperResponseMapper: Mappable {
    func map(_ input: AdminRentalReservationDataWrapperResponse) throws -> [AdminRentalReservation] {
        return try input.data.map { try AdminReservationMapper().map($0) }
    }
}

struct AdminRentalReservationDataWrapperResponse: Decodable {
    let data: [AdminRentalReservationResponse]
}

struct AdminRentalReservationResponse: Decodable {
    let id: Int
    let imo: String?
    let isArchived: Int
    let finalDailyRentPrice: String
    let realDailyRentPrice: String
    let paymentStatus: String
    let reservationAgreement: Int
    let currencyTypeAbbreviation: String?
    let currencySymbol: String
    let endDate: String 
    let totalPriceByCurrency: String
    let flightNo: String?
    let updatedAt: String?
    let currencyTypeDefinition: String?
    let paymentMethod: String
    let totalRentPrice: String
    let totalExtraServicePrice: String
    let priceType: String
    let totalPrice: String
    let currencyRate: String
    let startDate: String
    let createdAt: String
    let reservationStatus: String
    let transferCost: String
    let comment: String?
    let address: String?
    let pickupLocation: AdminRentalLocationResponse
    let dropOffLocation: AdminRentalLocationResponse
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imo = "imo_no"
        case isArchived = "is_archived"
        case finalDailyRentPrice = "final_daily_rent_price"
        case realDailyRentPrice = "real_daily_rent_price"
        case paymentStatus = "payment_status"
        case reservationAgreement = "reservation_agreement"
        case currencyTypeAbbreviation = "currency_type_abbreviation"
        case currencySymbol = "currency_symbol"
        case endDate = "end_date"
        case totalPriceByCurrency = "total_price_by_currency"
        case flightNo = "flight_no"
        case updatedAt = "updated_at"
        case currencyTypeDefinition = "currency_type_definition"
        case paymentMethod = "payment_method"
        case totalRentPrice = "total_rent_price"
        case totalExtraServicePrice = "total_extra_service_price"
        case priceType = "price_type"
        case totalPrice = "total_price"
        case currencyRate = "currency_rate"
        case startDate = "start_date"
        case createdAt = "created_at"
        case reservationStatus = "reservation_status"
        case transferCost = "transfer_cost"
        case comment
        case address
        case pickupLocation = "pickup_location"
        case dropOffLocation = "drop_location"
    }
}

struct AdminReservationMapper: Mappable {
    func map(_ input: AdminRentalReservationResponse) throws -> AdminRentalReservation {
        .init(id: input.id, imo: input.imo, isArchived: input.isArchived, finalDailyRentPrice: input.finalDailyRentPrice, realDailyRentPrice: input.realDailyRentPrice, paymentStatus: input.paymentStatus, reservationAgreement: input.reservationAgreement, currencyTypeAbbreviation: input.currencyTypeAbbreviation, currencySymbol: input.currencySymbol, endDate: input.endDate, totalPriceByCurrency: input.totalPriceByCurrency, flightNo: input.flightNo, updatedAt: input.updatedAt, currencyTypeDefinition: input.currencyTypeDefinition, paymentMethod: input.paymentMethod, totalRentPrice: input.totalRentPrice, totalExtraServicePrice: input.totalExtraServicePrice, priceType: input.priceType, totalPrice: input.totalPrice, currencyRate: input.currencyRate, startDate: input.startDate, createdAt: input.createdAt, reservationStatus: input.reservationStatus, transferCost: input.transferCost, comment: input.comment, address: input.address)
    }
}
