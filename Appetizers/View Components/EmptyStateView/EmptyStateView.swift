//
//  EmptyStateView.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/23/22.
//

import SwiftUI

struct EmptyStateView: View {
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            
            VStack(spacing: 32) {
                Image(systemName: imageName)
                    .resizable()
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.accentColor, .secondary)
                    .scaledToFit()
                    .frame(width: 100)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmptyStateView(imageName: "list.dash", message: "Oh no! Your order is empty.")
        }
    }
}
