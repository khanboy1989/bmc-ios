//
//  AdminProfileHeaderView.swift
//
//
//  Created by Serhan Khan on 27/03/2024.
//

import SwiftUI
import SystemDesign

public struct AdminProfileHeaderView: View {
    @Binding var imageUrl: String
    @Binding var adminFirstName: String
    @Binding var adminLastName: String
    private let title: String
    
    public init(imageUrl: Binding<String>, adminFirstName: Binding<String>, adminLastName: Binding<String>, title: String) {
        _imageUrl = imageUrl
        _adminFirstName = adminFirstName
        _adminLastName = adminLastName
        self.title = title
    }
    
    public var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 4) {
                if let url = URL(string: self.imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                        
                    } placeholder: {
                        ProgressView()
                            .colorScheme(.dark)
                    }.frame(width: 60, height: 60)
                        .padding()
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .colorScheme(.dark)
                        .cornerRadius(10)
                        .frame(width: 60, height: 60)
                        .padding()
                }
                
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

