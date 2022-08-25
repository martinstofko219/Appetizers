//
//  ButtonStyle.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/25/22.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.accentColor)
            .controlSize(.large)
    }
}
