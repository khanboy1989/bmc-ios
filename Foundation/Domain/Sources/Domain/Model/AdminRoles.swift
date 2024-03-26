//
//  AdminRoles.swift
//
//
//  Created by Serhan Khan on 26/03/2024.
//

import Foundation
import HelperMacros

@DefaultInit
public struct AdminRoles {
    public let profile: AdminProfileRoles
    public let dashboard: AdminDashboardRoles
    public let car: AdminCarOperationRoles
}

