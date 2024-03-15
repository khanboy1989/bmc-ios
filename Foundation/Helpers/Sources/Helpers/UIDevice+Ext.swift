//
//  UIDevice+Ext.swift
//
//
//  Created by Serhan Khan on 15.03.24.
//

import Foundation
import UIKit

public extension UIDevice {
    var modelIdentifier: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
    var deviceModel: iPhoneModel {
        let identifier = self.modelIdentifier
        return mapToDevice(identifier: identifier)
    }
    
    var isSimulator: Bool {
        return ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] != nil
    }
}

public enum iPhoneModel: String {
    case iPhone4, iPhone4s, iPhone5, iPhone5c, iPhone5s, iPhone6, iPhone6Plus, iPhone6s, iPhone6sPlus, iPhone7, iPhone7Plus, iPhone8, iPhone8Plus, iPhoneX, iPhoneXS, iPhoneXSMax, iPhoneXR, iPhone11, iPhone11Pro, iPhone11ProMax, iPhone12mini, iPhone12, iPhone12Pro, iPhone12ProMax, iPhone13mini, iPhone13, iPhone13Pro, iPhone13ProMax, iPhone14, iPhone14Plus, iPhone14Pro, iPhone14ProMax, iPhone15, iPhone15Plus, iPhone15Pro, iPhone15ProMax, iPhoneSE, iPhoneSE2, iPhoneSE3, unknown, simulator
    
    public var displayName: String {
        switch self {
        case .simulator:
            return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
        default:
            return self.rawValue
        }
    }
}

public func mapToDevice(identifier: String) -> iPhoneModel {
    switch identifier {
    case "iPhone3,1", "iPhone3,2", "iPhone3,3": return .iPhone4
    case "iPhone4,1": return .iPhone4s
    case "iPhone5,1", "iPhone5,2": return .iPhone5
    case "iPhone5,3", "iPhone5,4": return .iPhone5c
    case "iPhone6,1", "iPhone6,2": return .iPhone5s
    case "iPhone7,2": return .iPhone6
    case "iPhone7,1": return .iPhone6Plus
    case "iPhone8,1": return .iPhone6s
    case "iPhone8,2": return .iPhone6sPlus
    case "iPhone9,1", "iPhone9,3": return .iPhone7
    case "iPhone9,2", "iPhone9,4": return .iPhone7Plus
    case "iPhone10,1", "iPhone10,4": return .iPhone8
    case "iPhone10,2", "iPhone10,5": return .iPhone8Plus
    case "iPhone10,3", "iPhone10,6": return .iPhoneX
    case "iPhone11,2": return .iPhoneXS
    case "iPhone11,4", "iPhone11,6": return .iPhoneXSMax
    case "iPhone11,8": return .iPhoneXR
    case "iPhone12,1": return .iPhone11
    case "iPhone12,3": return .iPhone11Pro
    case "iPhone12,5": return .iPhone11ProMax
    case "iPhone13,1": return .iPhone12mini
    case "iPhone13,2": return .iPhone12
    case "iPhone13,3": return .iPhone12Pro
    case "iPhone13,4": return .iPhone12ProMax
    case "iPhone14,4": return .iPhone13mini
    case "iPhone14,5": return .iPhone13
    case "iPhone14,2": return .iPhone13Pro
    case "iPhone14,3": return .iPhone13ProMax
    case "iPhone14,7": return .iPhone14
    case "iPhone14,8": return .iPhone14Plus
    case "iPhone15,2": return .iPhone14Pro
    case "iPhone15,3": return .iPhone14ProMax
    case "iPhone15,4": return .iPhone15
    case "iPhone15,5": return .iPhone15Plus
    case "iPhone16,1": return .iPhone15Pro
    case "iPhone16,2": return .iPhone15ProMax
    case "iPhone8,4", "iPhone12,8": return .iPhoneSE
    case "iPhone14,6": return .iPhoneSE3
    default: return .unknown
    }
}

public func mapToiPhones(identifier: String) -> iPhoneModel? {
    switch identifier {
    case "iPhone5,1", "iPhone5,2": return .iPhone5
    case "iPhone5,3", "iPhone5,4": return .iPhone5c
    case "iPhone6,1", "iPhone6,2": return .iPhone5s
    case "iPhone7,2": return .iPhone6
    case "iPhone7,1": return .iPhone6Plus
    case "iPhone8,1": return .iPhone6s
    case "iPhone8,2": return .iPhone6sPlus
    case "iPhone9,1", "iPhone9,3": return .iPhone7
    case "iPhone9,2", "iPhone9,4": return .iPhone7Plus
    case "iPhone10,1", "iPhone10,4": return .iPhone8
    case "iPhone10,2", "iPhone10,5": return .iPhone8Plus
    case "iPhone10,3", "iPhone10,6": return .iPhoneX
    case "iPhone11,2": return .iPhoneXS
    case "iPhone11,4", "iPhone11,6": return .iPhoneXSMax
    case "iPhone11,8": return .iPhoneXR
    case "iPhone12,1": return .iPhone11
    case "iPhone12,3": return .iPhone11Pro
    case "iPhone12,5": return .iPhone11ProMax
    case "iPhone13,1": return .iPhone12mini
    case "iPhone13,2": return .iPhone12
    case "iPhone13,3": return .iPhone12Pro
    case "iPhone13,4": return .iPhone12ProMax
    case "iPhone14,4": return .iPhone13mini
    case "iPhone14,5": return .iPhone13
    case "iPhone14,2": return .iPhone13Pro
    case "iPhone14,3": return .iPhone13ProMax
    case "iPhone14,7": return .iPhone14
    case "iPhone14,8": return .iPhone14Plus
    case "iPhone15,2": return .iPhone14Pro
    case "iPhone15,3": return .iPhone14ProMax
    case "iPhone15,4": return .iPhone15
    case "iPhone15,5": return .iPhone15Plus
    case "iPhone16,1": return .iPhone15Pro
    case "iPhone16,2": return .iPhone15ProMax
    case "iPhone8,4", "iPhone12,8", "iPhone14,6": return .iPhoneSE
    case "i386", "x86_64", "arm64": return .simulator
    default: return nil
    }
}
