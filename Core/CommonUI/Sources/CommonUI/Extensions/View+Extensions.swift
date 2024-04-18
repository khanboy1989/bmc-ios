//
//  View+Extensions.swift
//
//
//  Created by Serhan Khan on 16/03/2024.
//

import Foundation

import SwiftUI

public extension View {
    func customBackButton(action: @escaping () -> Void) -> some View {
        navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        action()
                    } label: {
                        Image("back")
                            .tint(.white)
                    }
                }
            }
    }
    
    func screenBackground(with color: Color) -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color)
    }
}

public struct DefaultListModifier: ViewModifier {
    public let inset: EdgeInsets
    public init(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) {
        inset = .init(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
    
    public func body(content: Content) -> some View {
        content
            .listRowSeparator(.hidden)
            .listRowInsets(inset)
            .listRowBackground(Color.clear)
    }
}

public extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

public struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: [Edge]
    
    public init(width: CGFloat, edges: [Edge]) {
        self.width = width
        self.edges = edges
    }
    
    public func path(in rect: CGRect) -> Path {
        edges.map { edge -> Path in
            switch edge {
            case .top: return Path(.init(x: rect.minX, y: rect.minY, width: rect.width, height: width))
            case .bottom: return Path(.init(x: rect.minX, y: rect.maxY - width, width: rect.width, height: width))
            case .leading: return Path(.init(x: rect.minX, y: rect.minY, width: width, height: rect.height))
            case .trailing: return Path(.init(x: rect.maxX - width, y: rect.minY, width: width, height: rect.height))
            }
        }.reduce(into: Path()) { $0.addPath($1) }
    }
}

public extension View {
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

public extension View {
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
}

public struct ViewDidLoadModifier: ViewModifier {

    @State private var didLoad = false
    private let action: (() -> Void)?

    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }

    public func body(content: Content) -> some View {
        content.onAppear {
            if didLoad == false {
                didLoad = true
                action?()
            }
        }
    }

}
