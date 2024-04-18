//
//  AdminMainProfile.swift
//
//
//  Created by Serhan Khan on 26/03/2024.
//

import SwiftUI
import HelperMacros

public enum AdminRoleType: String {
    case superadmin = "superadmin"
    case admin = "admin"
    case accountant = "accountant"
}

@DefaultInit
public struct AdminMainProfile: Equatable {
    public let gender: String
    public let country: String
    public let id: Int
    public let lastname: String
    public let firstname: String
    public let role: AdminRoleType
    public let username: String
    public let email: String
    public let phone_no: String
    public let profileImage: String
    public let roles: AdminRoles
    
    public static func == (lhs: AdminMainProfile, rhs: AdminMainProfile) -> Bool {
        return lhs.id == rhs.id
    }
}

