//
//  BmcApp.swift
//  Bmc
//
//  Created by Serhan Khan on 09/03/2024.
//

import SwiftUI

@main
struct BmcApp: App {
    @State var email: String = "email"
    @State var password: String = "password"
    var body: some Scene {
        WindowGroup {
            LoginCoordinator(email: email, password: password)
        }
    }
}
