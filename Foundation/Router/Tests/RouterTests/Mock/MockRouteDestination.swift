//
//  File.swift
//  
//
//  Created by Serhan Khan on 11/03/2024.
//

import Foundation

public enum MockRouteDestination: Hashable {
    case navigateOne
    case navigateTwo
}

enum MockPresenter: Identifiable {
    case showError
    
    var id: String{
        switch self {
        case .showError:
            return "showError"
        }
    }
}
