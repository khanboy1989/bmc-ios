//
//  AdminTransferReservation.swift
//  
//
//  Created by Serhan Khan on 05/06/2024.
//

import Foundation
import HelperMacros
import Helpers

@DefaultInit
public struct AdminTransferReservation: Identifiable, Equatable, Hashable {
    public var id: Int
    public let imo: String?
    public let isArchived: Bool
    public let finalDailyRentPrice: String
    public let realDailyRentPrice: String
    public let paymentStatus: String
    public let reservationAgreement: Int
    public let currencyTypeAbbreviation: String?
    public let currencySymbol: String
    public let endDate: String
    public let totalPriceByCurrency: String
    public let flightNo: String?
    public let currencyTypeDefinition: String?
    public let paymentMethod: String
    public let totalRentPrice: String
    public let totalExtraServicePrice: String
    public let priceType: String
    public let totalPrice: String
    public let currencyRate: String
    public let startDate: String
    public let reservationStatus: String
    public let transferCost: String
    public let comment: String?
    public let address: String?
    public let pickupLocation: AdminReservationLocation?
    public let dropoffLocation: AdminReservationLocation?
    public let customer: Customer
    public let carInformation: RentalCarInformation
    public let extraServices: [AdminRentalExtraServices]

    public static func == (lhs: AdminTransferReservation, rhs: AdminTransferReservation) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
