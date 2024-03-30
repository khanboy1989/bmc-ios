//
//  AdminProfile.swift
//
//
//  Created by Serhan Khan on 24/03/2024.
//

import Foundation
import HelperMacros

@DefaultInit
public struct AdminProfileRoles {
    public let me: AdminMeRoles
}

@DefaultInit
public struct AdminMeRoles {
    public let read: Bool
    public let update: Bool 
}
