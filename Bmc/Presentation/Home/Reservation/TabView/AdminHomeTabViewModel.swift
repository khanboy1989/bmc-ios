//
//  AdminHomeTabViewModel.swift
//  Bmc
//
//  Created by Serhan Khan on 31/03/2024.
//

import SwiftUI
import Domain
import Network

final class AdminHomeTabViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var profile: AdminMainProfile?
    @Published var shouldLogout: Bool = false
    
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
            if let error = error as? APIError {
                switch error {
                case .invalidRefreshToken:
                    self.shouldLogout = true
                default:
                    print("profile fetch error = \(error.localizedDescription)")
                }
            }
        }
    }
}

