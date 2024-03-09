//
//  ContentView.swift
//  Bmc
//
//  Created by Serhan Khan on 09/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Asset.Images.splashLogo.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
            Text(L10n.ok)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
