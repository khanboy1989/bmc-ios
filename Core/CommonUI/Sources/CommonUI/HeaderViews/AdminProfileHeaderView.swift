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
            HStack(alignment: .top) {
                let _ = print("image url = \(self.imageUrl)")
//                AsyncImage(url: URL(string: imageUrl), scale: 16.0)
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 50, height: 50)
//                    .cornerRadius(10)
//                    .padding()
                AsyncImage(url: URL(string: self.imageUrl)) { image in
                   image
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .cornerRadius(10)
                       
               } placeholder: {
                   ProgressView()
                       .colorScheme(.dark)
               }.frame(width: 80, height: 80)
                .padding()
                
                Spacer()
                Text(self.adminFirstName)
            }
        }.frame(maxWidth: .infinity) // Set maxWidth to cover all width
         .background(Asset.Colors.primaryColor.swiftUIColor)
    }
}

