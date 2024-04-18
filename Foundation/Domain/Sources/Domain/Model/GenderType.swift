//
//  GenderType.swift
//
//
//  Created by Serhan Khan on 14/04/2024.
//

import Foundation
import SystemDesign

public enum GenderType: Int, Decodable {
    case male = 1
    case female = 2
    case other = 3 
    
    var description: String {
        switch self {
        case .male:
            return L10n.male
        case .female:
            return L10n.female
        case .other:
            return L10n.other
        }
    }
}
