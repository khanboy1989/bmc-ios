//
//  RentalCarInformation.swift
//
//
//  Created by Serhan Khan on 14/04/2024.
//

import HelperMacros

@DefaultInit
public struct RentalCarInformation {
    public let id: Int
    public let image: String
    public let colorEN: String
    public let colorTR: String
    public let numberOfPassangers: Int
    public let enginePower: Int
    public let gearType: String
    public let details: String
    public let doorCount: Int
    public let isTransportationOnly: Bool
    public let plate: String
    public let isAvailable: Bool
}
