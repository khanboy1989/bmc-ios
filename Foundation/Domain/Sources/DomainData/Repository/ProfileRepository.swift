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

public final class ProfileRepository: IProfileRepository {

    private let networkClient: INetworkClient
    private let userDefaults: IUserDefaultsService
    
    public init(networkClient: INetworkClient, userDefaults: IUserDefaultsService) {
        self.networkClient = networkClient
        self.userDefaults = userDefaults
    }
    
    public func getProfile() async throws -> AdminMainProfile {
        do {
            let result = try await self.networkClient.request(AdminApiEndpoints.profile(), mapper: AdminProfileDataWrapperMapper())
            return result
        } catch {
            throw error
        }
    }
    
    public func refreshTokenAndRetryRequest() async throws {
        do {
            try await self.networkClient.refreshTokenAndRetryRequest()
        }catch {
            print("refresh token error = \(error.localizedDescription)")
        }
    }
}
