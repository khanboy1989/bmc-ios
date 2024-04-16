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
                AsyncImage(url: URL(string: Constants.imageBaseUrl + item.carInformation.image), content: {
                    phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "car")
                            .resizable()
                            .colorScheme(.light)
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(4)
                            .frame(width: 40, height: 40)
                            .padding()
                    case let .success(image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(4)
                            .frame(width: 40, height: 40)
                            .padding()
                    case .failure(_):
                        Image(systemName: "car")
                            .resizable()
                            .colorScheme(.light)
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(4)
                            .frame(width: 40, height: 40)
                            .padding()
                    @unknown default:
                        EmptyView()
                    }
                })
                
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
                    .font(FontFamily.SFPro.medium.swiftUIFont(size: 12))
                    .foregroundStyle(.blue)
                
                Text(L10n.dropOffDate)
                    .font(FontFamily.SFPro.regular.swiftUIFont(size: 12))
                    .foregroundStyle(.black)
                
                Text(item.endDate.toDate())
                    .font(FontFamily.SFPro.medium.swiftUIFont(size: 12))
                    .foregroundStyle(.red)
            }
            
        }
    }
}
