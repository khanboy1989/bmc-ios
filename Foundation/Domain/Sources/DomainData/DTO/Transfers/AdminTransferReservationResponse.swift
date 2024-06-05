//
//  AdminTransferReservationResponse.swift
//
//
//  Created by Serhan Khan on 05/06/2024.
//

import Foundation
import Network
import Domain
import Helpers

struct AdminTransferReservationDataWrapperResponseMapper: Mappable {
    func map(_ input: AdminTransferReservationDataWrapperResponse) throws -> [AdminTransferReservation] {
        return try input.data.map { try AdminTransferReservationMapper().map($0) }
    }
}

struct AdminTransferReservationDataWrapperResponse: Decodable {
    let data: [AdminTransferReservationResponse]
}

struct AdminTransferReservationResponse: Decodable {
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
    let pickupLocation: AdminReservationLocationResponse?
    let dropOffLocation: AdminReservationLocationResponse?
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

struct AdminTransferReservationMapper: Mappable {
    func map(_ input: AdminTransferReservationResponse) throws -> AdminTransferReservation {
        return .init(
            id: input.id,
            imo: input.imo,
            isArchived: input.isArchived.boolValue,
            finalDailyRentPrice: input.finalDailyRentPrice,
            realDailyRentPrice: input.realDailyRentPrice,
            paymentStatus: input.paymentStatus,
            reservationAgreement: input.reservationAgreement,
            currencyTypeAbbreviation: input.currencyTypeAbbreviation,
            currencySymbol: input.currencySymbol,
            endDate: input.endDate,
            totalPriceByCurrency: input.totalPriceByCurrency,
            flightNo: input.flightNo,
            currencyTypeDefinition: input.currencyTypeDefinition,
            paymentMethod: input.paymentMethod,
            totalRentPrice: input.totalRentPrice,
            totalExtraServicePrice: input.totalExtraServicePrice,
            priceType: input.priceType,
            totalPrice: input.totalPrice,
            currencyRate: input.currencyRate,
            startDate: input.startDate,
            reservationStatus: input.reservationStatus,
            transferCost: input.transferCost,
            comment: input.comment,
            address: input.address,
            pickupLocation: mapLocation(input.pickupLocation),
            dropoffLocation: mapLocation(input.dropOffLocation),
            customer: .init(
                profileImage: input.customer.image,
                name: input.customer.firstName,
                surname: input.customer.lastName,
                address: input.customer.address,
                customerType: input.customer.customerType,
                dateOfBirth: input.customer.dateOfBirth,
                companyName: input.customer.companyName,
                driverLicenceNo: input.customer.driverLicenceNo,
                countryTR: input.customer.countryPrefix.country.titleTR,
                countryEN: input.customer.countryPrefix.country.titleEN,
                isBlocked: input.customer.isBlocked.boolValue,
                phoneNo: input.customer.phoneNo,
                email: input.customer.email
            ),
            carInformation: mapCarInformation(input.carInformation),
            extraServices: mapExtraServices(input.extraServices)
        )
    }
    
    private func mapExtraServices(_ input: [AdminRentalExtraServicesResponse]) -> [AdminRentalExtraServices] {
        return input.compactMap { try? AdminRentalExtraServicesResponseMapper().map($0) }
    }
    
    private func mapLocation(_ input: AdminReservationLocationResponse?) -> AdminReservationLocation? {
        guard let input = input else { return nil }
        return .init(
            id: input.id,
            definitionTR: input.definitionTR,
            transferCost: input.transferCost,
            definitionEN: input.definitionEN,
            taxiCost: input.taxiCost,
            isTransportationOnly: input.isTransportationOnly.boolValue,
            definition: input.definition
        )
    }
    
    private func mapCarInformation(_ input: AdminRentalCarInformationResponse) -> RentalCarInformation {
        return .init(
            id: input.id,
            image: input.image,
            colorEN: input.colorEN,
            colorTR: input.colorTR,
            numberOfPassangers: input.numberOfPassengers,
            enginePower: input.enginePower,
            gearType: input.gearType.definition,
            details: input.details,
            doorCount: input.doorCount,
            isTransportationOnly: input.isTransportationOnly.boolValue,
            plate: input.plate,
            isAvailable: input.isAvailable.boolValue
        )
    }
}
