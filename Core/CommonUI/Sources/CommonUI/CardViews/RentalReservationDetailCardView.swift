//
//  RentalReservationDetailCardView.swift
//  
//
//  Created by Serhan Khan on 29/04/2024.
//

import SwiftUI

public struct RentalReservationDetailCardView: View {
    
    let title: String
    let value: String
    let font: Font
    let textColor: Color
    
    public init(title: String, value: String, font: Font, textColor: Color) {
        self.title = title
        self.value = value
        self.font = font
        self.textColor = textColor
    }
    
    public var body: some View {
        HStack(alignment:.center , spacing: 4) {
            Text(title)
                .font(font)
                .foregroundStyle(textColor)
           
            Text(value)
                .font(font)
                .foregroundStyle(textColor)
        }
    }
}

