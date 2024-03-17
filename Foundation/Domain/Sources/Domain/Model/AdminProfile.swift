//
//  AdminProfile.swift
//
//
//  Created by Serhan Khan on 17/03/2024.
//

import Foundation
import HelperMacros

@DefaultInit
public struct AdminProfile: Equatable {
    public let token: String
    public let refreshToken: String
    public let success: Bool
    public let message: String
}
