//
//  AdminTabViewModel.swift
//
//
//  Created by Serhan Khan on 24/03/2024.
//

import SwiftUI
import Domain

final class AdminTabViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var profile: AdminMainProfile?
    
    struct Dependecies {
        let profileRepository: IProfileRepository
    }
    
    private let profileRepository: IProfileRepository

    init(dependecies: Dependecies) {
        self.profileRepository = dependecies.profileRepository
    }
    
    func fetchProfile() async {
        do {
            let profile = try await self.profileRepository.getProfile()
            await MainActor.run(body: { [weak self] in
                self?.name = profile.firstname
                self?.profile = profile
            })
        } catch {
            print("profile fetch error = \(error.localizedDescription)")
        }
    }
    
    func refreshToken() async {
        try? await self.profileRepository.refreshTokenAndRetryRequest()
    }
}
