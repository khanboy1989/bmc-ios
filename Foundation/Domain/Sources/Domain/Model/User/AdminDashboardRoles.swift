//
//  AdminDashboardRoles.swift
//
//
//  Created by Serhan Khan on 26/03/2024.
//

import HelperMacros

@DefaultInit
public struct AdminDashboardRoles {
    public let customerType: AdminCustomerTypeRoles
    public let adminUser: AdminUserRoles
    public let documentType: AdminDocumentTypeRoles
    public let customer: AdminCustomerRoles
    public let about: AdminAboutUsRoles
    public let workinHours: AdminWorkingHoursRoles
    public let contact: AdminContactRoles
}

@DefaultInit
public struct AdminCustomerTypeRoles {
    public let read: Bool
}

@DefaultInit
public struct AdminUserRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}

@DefaultInit
public struct AdminDocumentTypeRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}

@DefaultInit
public struct AdminContactRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}

@DefaultInit
public struct AdminAboutUsRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}

@DefaultInit
public struct AdminWorkingHoursRoles {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

@DefaultInit
public struct AdminCustomerRoles {
    public let store: Bool
    public let update: Bool
    public let read: Bool
    public let destroy: Bool
}
