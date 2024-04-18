//
//  AdminProfileHeaderView.swift
//
//
//  Created by Serhan Khan on 27/03/2024.
//

import SwiftUI
import SystemDesign
import Helpers

public struct AdminProfileHeaderView: View {
    let imageUrl: String
    let adminFirstName: String
    let adminLastName: String
    private let title: String
    
    public init(imageUrl: String, adminFirstName: String, adminLastName: String, title: String) {
        self.imageUrl = imageUrl
        self.adminFirstName = adminFirstName
        self.adminLastName = adminLastName
        self.title = title
    }
    
    public var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 4) {
                AsyncImageView(imageUrl: self.imageUrl, placeHolder: "person.circle.fill", height: 60, width: 60, cornerRadius: 10, colorScheme: .dark)
                    .padding()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(self.adminFirstName)
                        .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                        .foregroundStyle(.white)
                    
                    Text(self.adminLastName)
                        .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                        .foregroundStyle(.white)
                }
                
                Spacer()
                    
                Text(title)
                    .font(FontFamily.SFPro.bold.swiftUIFont(size: 20))
                    .foregroundStyle(.white)
                
                Spacer()
            }
        }.frame(maxWidth: .infinity) // Set maxWidth to cover all width
         .background(Asset.Colors.primaryColor.swiftUIColor)
    }
}

