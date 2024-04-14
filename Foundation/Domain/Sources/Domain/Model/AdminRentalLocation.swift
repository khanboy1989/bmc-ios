//
//  AdminRentalLocation.swift
//
//
//  Created by Serhan Khan on 13/04/2024.
//

import HelperMacros

@DefaultInit
public struct AdminRentalLocation {
    let id: Int
    let definitionTR: String
    let deletedAt: String?
    let transferCost: String
    let definitionEN: String
    let taxiCost: String
    let createdAt: String
    let updatedAt: String
    let isTransportationOnly: Bool
    let definition: String
}
