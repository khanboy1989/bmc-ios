//
//  UIDevice+Helpers.swift
//  Bmc
//
//  Created by Serhan Khan on 15/03/2024.
//

import Foundation
import UIKit
import Helpers

//Device Related Configuration
final class DeviceConfiguration {
    
    /// This function returns device display name such as iPhone 15 Pro Max
    /// - Returns: String
     func getDeviceDisplayName() -> String {
        let device = UIDevice.current
        let modelIdentifier = device.modelIdentifier
        return  mapToiPhones(identifier: modelIdentifier).displayName
    }    
}
