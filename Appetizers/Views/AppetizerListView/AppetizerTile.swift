//
//  AppetizerTile.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/21/22.
//

import SwiftUI

struct AppetizerTile: View {
    
    let item: Appetizer
    
    var body: some View {
        HStack {
            Image(item.imageURL)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 90).cornerRadius(8)
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name).font(.title2).fontWeight(.bold).scaledToFit().minimumScaleFactor(0.6)
                Text("$\(item.price, specifier: "%.2f")").font(.body).fontWeight(.semibold).foregroundColor(.secondary)
            }.padding(.leading)
        }
    }
}

struct AppetizerTile_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTile(item: MockData.sampleItem)
    }
}
