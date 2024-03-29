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
    
    public init(imageUrl: Binding<String>, adminFirstName: Binding<String>) {
        _imageUrl = imageUrl
        _adminFirstName = adminFirstName
    }
    
    public var body: some View {
        ZStack {
            HStack(alignment: .center) {
                let _ = print("image url = \(self.imageUrl)")
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
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .colorScheme(.dark)
                        .cornerRadius(10)
                        .frame(width: 60, height: 60)
                        .padding()
                }
                Spacer()
                Text(self.adminFirstName)
            }
        }.frame(maxWidth: .infinity) // Set maxWidth to cover all width
         .background(Asset.Colors.primaryColor.swiftUIColor)
    }
}

