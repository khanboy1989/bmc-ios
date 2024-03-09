//
//  BmcApp.swift
//  Bmc
//
//  Created by Serhan Khan on 09/03/2024.
//

import SwiftUI

@main
struct BmcApp: App {
    var body: some Scene {
        WindowGroup {
            Text(PlistFiles.apiStageBaseURL)
        }
    }
}
