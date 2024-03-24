//
//  AppRootCoordinator.swift
//  Bmc
//
//  Created by Serhan Khan on 24/03/2024.
//

import Foundation

final class AppRootCoordinator: ObservableObject {
    @Published var currentCoordinator: AppRootCoordintors = .adminLogin
    
    enum AppRootCoordintors {
        case adminLogin
        case home
    }
}
