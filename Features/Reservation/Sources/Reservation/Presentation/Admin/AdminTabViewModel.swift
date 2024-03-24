//
//  AdminTabViewModel.swift
//
//
//  Created by Serhan Khan on 24/03/2024.
//

import SwiftUI
import Domain

final class AdminTabViewModel: ObservableObject {
    
    struct Dependecies {
        let profileRepository: IProfileRepository
    }
    
    private let profileRepository: IProfileRepository

    init(dependecies: Dependecies) {
        self.profileRepository = dependecies.profileRepository
    }
    
    func fetchProfile() async {
        try? await self.profileRepository.getProfile()
    }
}
