//
//  Bundle+Extensions.swift
//  Bmc
//
//  Created by Serhan Khan on 17/03/2024.
//

import Foundation

extension Bundle {
    
    var identifier: String {
        guard let bundleIdentifier =  Bundle.main.bundleIdentifier  else {
            return "vipersoft.tech.bmc"
        }
        return bundleIdentifier
    }
}
