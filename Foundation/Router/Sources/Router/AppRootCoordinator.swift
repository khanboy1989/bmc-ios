//
//  AppRootCoordinator.swift
//  
//
//  Created by Serhan Khan on 24/03/2024.
//

import SwiftUI

public final class AppRootCoordinator: ObservableObject {

    @Published public var current: CoordinatorType = .adminLogin

    public init(current: CoordinatorType) {
        self.current = current
    }

    public enum CoordinatorType {
        case adminLogin
        case adminHome
    }
}
