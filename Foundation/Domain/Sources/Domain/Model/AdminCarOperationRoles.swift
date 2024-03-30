//
//  AdminCarOperationRoles.swift
//  
//
//  Created by Serhan Khan on 26/03/2024.
//

import HelperMacros

@DefaultInit
public struct AdminCarOperationRoles {
    public let fuelType: AdminFuelTypeRoles
    public let car: AdminCarRoles
    public let gearType: AdminGearTypeRoles
    public let model: AdminCarModelRoles
    public let size: AdminCarSizeRoles
    public let carClass: AdminCarClassRoles
    public let spec: AdminCarSpecsRoles
    public let carType: AdminCarTypeRoles
    public let price: AdminCarPriceRoles
}

@DefaultInit
public struct AdminFuelTypeRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}

@DefaultInit
public struct AdminCarRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}

@DefaultInit
public struct AdminGearTypeRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}

@DefaultInit
public struct AdminCarModelRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}

@DefaultInit
public struct AdminCarSizeRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}

@DefaultInit
public struct AdminCarClassRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}

@DefaultInit
public struct AdminCarBrandRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}

@DefaultInit
public struct AdminCarSpecsRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}

@DefaultInit
public struct AdminCarTypeRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}

@DefaultInit
public struct AdminCarPriceRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}
