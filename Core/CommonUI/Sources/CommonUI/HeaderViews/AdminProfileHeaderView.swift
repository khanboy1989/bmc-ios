//
//  AdminProfileHeaderView.swift
//
//
//  Created by Serhan Khan on 27/03/2024.
//

import SwiftUI
import SystemDesign

public struct AdminProfileHeaderView: View {
    
    private let imageUrl: String?
    
    public init(imageUrl: String?) {
        self.imageUrl = imageUrl
    }
    
    public var body: some View {
        ZStack {
            HStack(alignment: .top) {
                if let imageUrl = self.imageUrl {
                    AsyncImage(url: URL(string: imageUrl), scale: 16.0)
                          .aspectRatio(contentMode: .fit)
                          .frame(width: 50, height: 50)
                          .cornerRadius(10)
                          .padding()
                }
                Spacer()
            }
        }.frame(maxWidth: .infinity) // Set maxWidth to cover all width
        .background(Asset.Colors.primaryColor.swiftUIColor)

    }
}

