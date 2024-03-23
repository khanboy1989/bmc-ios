//
//  BaseViewModel.swift
//
//
//  Created by Serhan Khan on 17/03/2024.
//

import Foundation
import Network
import SystemDesign

open class BaseViewModel {
    
    public init() {}
    
    public final func handleError(_ error: any Error) -> String {
        if let error = error as? APIError {
            switch error {
            case let .customError(message , _):
                return message
            case let .networkError(error, _):
                return error.localizedDescription
            default:
                return error.localizedDescription
            }
        } else {
            return L10n.unknownError
        }
    }
}
