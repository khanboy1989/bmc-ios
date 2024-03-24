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
    
    func isLoggedIn(for key: String) -> String? {
        return self.userDefaultsService.loadFromUserDefaults(String.self, for: key)
    }
}
