//
//  AdminRentalReservationCell.swift
//
//
//  Created by Serhan Khan on 16/04/2024.
//

import SwiftUI
import SystemDesign
import Helpers
import Domain

public struct AdminRentalReservationCell: View {
    private let item: AdminRentalReservation
    
    public init(item: AdminRentalReservation) {
        self.item = item
    }
    
    public var body: some View {
        
        HStack(alignment: .center) {
            VStack(alignment: .center) {
                AsyncImageView(imageUrl: item.carInformation.image, placeHolder: "car", height: 40, width: 40, cornerRadius: 4)
                Text(item.carInformation.plate)
                    .font(FontFamily.SFPro.regular.swiftUIFont(size: 12))
                    .foregroundStyle(.black)
            }
            
            Spacer()
            
            VStack (alignment: .center){
                Text(item.customer.name)
                    .font(FontFamily.SFPro.regular.swiftUIFont(size: 14))
                    .foregroundStyle(.black)
                Text(item.customer.surname)
                    .font(FontFamily.SFPro.regular.swiftUIFont(size: 14))
                    .foregroundStyle(.black)
            }
            
            Spacer()
            
            VStack(alignment: .center, spacing: 4) {
                Text(L10n.pickupDate)
                    .font(FontFamily.SFPro.regular.swiftUIFont(size: 12))
                    .foregroundStyle(.black)
                
                Text(item.startDate.toDate())
                    .font(FontFamily.SFPro.medium.swiftUIFont(size: 14))
                    .foregroundStyle(.green)
                
                Text(L10n.dropOffDate)
                    .font(FontFamily.SFPro.regular.swiftUIFont(size: 12))
                    .foregroundStyle(.black)
                
                Text(item.endDate.toDate())
                    .font(FontFamily.SFPro.medium.swiftUIFont(size: 14))
                    .foregroundStyle(.red)
            }
            
        }
    }
}
