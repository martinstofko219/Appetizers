//
//  NutritionInfoView.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/22/22.
//

import SwiftUI

struct NutritionInfoView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .textCase(.uppercase)
                .foregroundColor(.secondary)
            
            Text(value)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
        }
    }
}

struct NutritionInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionInfoView(title: "Protein", value: "20g")
    }
}
