//
//  EmptyErrorView.swift
//
//
//  Created by Serhan Khan on 04/05/2024.
//

import SwiftUI
import SystemDesign

public struct EmptyErrorView: View {
    let message: String
    let buttonTitle: String
    let action: () -> Void
    
    public init(message: String, buttonTitle: String, action: @escaping () -> Void) {
        self.message = message
        self.buttonTitle = buttonTitle
        self.action = action
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            Text(message)
                .font(FontFamily.SFPro.medium.swiftUIFont(size: 16))
                .foregroundStyle(Asset.Colors.blackColor.swiftUIColor)
            
            Button(action: {
                action()
                
            }) {
                Text(buttonTitle)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Asset.Colors.primaryColor.swiftUIColor)
                    .cornerRadius(10)
            }
            .padding()
        }
        
    
    }
}

