//
//  AppetizerTileImageStyle.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/25/22.
//

import SwiftUI

struct AppetizerTileImageStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 120, height: 90)
            .cornerRadius(8)
    }
}
