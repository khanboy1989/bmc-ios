//
//  View+Ext.swift
//
//
//  Created by Serhan Khan on 16/04/2024.
//

import SwiftUI

public extension View {
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
}
