//
//  AdminRentalReservation.swift
//  
//
//  Created by Serhan Khan on 12/04/2024.
//

import Foundation
import HelperMacros

@DefaultInit
public struct AdminRentalReservation {
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
}
