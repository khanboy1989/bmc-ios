//
//  IProfileRepository.swift
//
//
//  Created by Serhan Khan on 24/03/2024.
//

import Foundation

public protocol IProfileRepository {
    func getProfile() async throws
    func refreshTokenAndRetryRequest() async throws
}
