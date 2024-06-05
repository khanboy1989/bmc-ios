//
//  AdminRentalLocation.swift
//
//
//  Created by Serhan Khan on 13/04/2024.
//

import HelperMacros

@DefaultInit
public struct AdminRentalLocation {
    public let id: Int
    public let definitionTR: String
    public let transferCost: String
    public let definitionEN: String
    public let taxiCost: String
    public let isTransportationOnly: Bool
    public let definition: String
}
