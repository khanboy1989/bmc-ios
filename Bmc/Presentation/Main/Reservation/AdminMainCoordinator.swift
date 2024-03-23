//
//  AdminMainCoordinator.swift
//  Bmc
//
//  Created by Serhan Khan on 23/03/2024.
//

import SwiftUI
import Reservation
import Router


struct AdminMainCoordinator: View {
    @ObservedObject private var router = Router()
    var body: some View {
        AdminMainTabViewCoordinator()
            .environmentObject(router)
    }
}

#Preview {
    AdminMainCoordinator()
}
