//
//  UserDefaultsClient.swift
//  Bmc
//
//  Created by Serhan Khan on 23/03/2024.
//

import Foundation
import Utilities
import Domain
import StorageKeys

final class UserDefaultsClient {
   
    private let userDefaultsService: IUserDefaultsService

    init(userDefaultsService: IUserDefaultsService) {
        self.userDefaultsService = userDefaultsService
    }
    
    func isLoggedIn() -> Bool {
        return self.userDefaultsService.loadBoolean(for: StorageKeys.Keys.isLoggedIn.rawValue)
    }
}
