//
//  ProfileRepository.swift
//
//
//  Created by Serhan Khan on 24/03/2024.
//

import Foundation
import Domain
import Network
import Utilities
import StorageKeys

public final class ProfileRepository: IProfileRepository {
    
    private let networkClient: INetworkClient
    private let userDefaults: IUserDefaultsService
    
    public init(networkClient: INetworkClient, userDefaults: IUserDefaultsService) {
        self.networkClient = networkClient
        self.userDefaults = userDefaults
    }
    
    public func getProfile() async throws {
    }
    
    
}
