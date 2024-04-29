//
//  AdminRentalReservationsResponse.swift
//
//
//  Created by Serhan Khan on 02/04/2024.
//

import Foundation
import Network
import Domain
import Helpers

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
    let customer: CustomerResponse
    let carInformation: AdminRentalCarInformationResponse
    let extraServices: [AdminRentalExtraServicesResponse]
    
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
        case customer
        case carInformation = "car_information"
        case extraServices = "extra_services"
    }
}

struct AdminReservationMapper: Mappable {
    func map(_ input: AdminRentalReservationResponse) throws -> AdminRentalReservation {
        .init(id: input.id, imo: input.imo, isArchived: input.isArchived.boolValue, finalDailyRentPrice: input.finalDailyRentPrice, realDailyRentPrice: input.realDailyRentPrice, paymentStatus: input.paymentStatus, reservationAgreement: input.reservationAgreement, currencyTypeAbbreviation: input.currencyTypeAbbreviation, currencySymbol: input.currencySymbol, endDate: input.endDate, totalPriceByCurrency: input.totalPriceByCurrency, flightNo: input.flightNo, updatedAt: input.updatedAt, currencyTypeDefinition: input.currencyTypeDefinition, paymentMethod: input.paymentMethod, totalRentPrice: input.totalRentPrice, totalExtraServicePrice: input.totalExtraServicePrice, priceType: input.priceType, totalPrice: input.totalPrice, currencyRate: input.currencyRate, startDate: input.startDate, createdAt: input.createdAt, reservationStatus: input.reservationStatus, transferCost: input.transferCost, comment: input.comment, address: input.address, pickupLocation: .init(id: input.pickupLocation.id, definitionTR: input.pickupLocation.definitionTR, deletedAt: input.pickupLocation.deletedAt, transferCost: input.pickupLocation.transferCost, definitionEN: input.pickupLocation.definitionEN, taxiCost: input.pickupLocation.taxiCost, createdAt: input.pickupLocation.createdAt, updatedAt: input.pickupLocation.updatedAt, isTransportationOnly: input.pickupLocation.isTransportationOnly.boolValue, definition: input.pickupLocation.definition), dropoffLocation: .init(id: input.dropOffLocation.id, definitionTR: input.dropOffLocation.definitionTR, deletedAt: input.dropOffLocation.deletedAt, transferCost: input.dropOffLocation.transferCost, definitionEN: input.dropOffLocation.definitionEN, taxiCost: input.dropOffLocation.taxiCost, createdAt: input.dropOffLocation.createdAt, updatedAt: input.dropOffLocation.updatedAt, isTransportationOnly: input.dropOffLocation.isTransportationOnly.boolValue, definition: input.dropOffLocation.definition), customer: .init(profileImage: input.customer.image, name: input.customer.firstName, surname: input.customer.lastName, address: input.customer.address, customerType: input.customer.customerType, dateOfBirth: input.customer.dateOfBirth, companyName: input.customer.companyName, driverLicenceNo: input.customer.driverLicenceNo, countryId: input.customer.countryId, countryPrefixId: input.customer.countryPrefixId, isBlocked: input.customer.isBlocked.boolValue, phoneNo: input.customer.phoneNo, email: input.customer.email), carInformation: .init(id: input.carInformation.id, image: input.carInformation.image, colorEN: input.carInformation.colorEN, colorTR: input.carInformation.colorTR, numberOfPassangers: input.carInformation.numberOfPassengers, enginePower: input.carInformation.enginePower, gearType: input.carInformation.gearType.definition, details: input.carInformation.details, doorCount: input.carInformation.doorCount, isTransportationOnly: input.carInformation.isTransportationOnly.boolValue, plate: input.carInformation.plate, isAvailable: input.carInformation.isAvailable.boolValue), 
              extraServices: mapExtraServices(input.extraServices))
    }
    
    private func mapExtraServices(_ input: [AdminRentalExtraServicesResponse]) ->  [AdminRentalExtraServices] {
        return  input.compactMap {  try? AdminRentalExtraServicesResponseMapper().map($0) }
    }
}
