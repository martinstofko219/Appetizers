//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/22/22.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerImage(urlString: appetizer.imageURL)
                .frame(width: 320, height: 225)
                .scaledToFit()
            VStack {
                Text(appetizer.name).font(.title2).fontWeight(.bold)
                Text(appetizer.description).multilineTextAlignment(.center).padding()
                
                HStack(spacing: 40){
                    NutritionInfoView(title: "protein", value: "\(appetizer.protein)g")
                    NutritionInfoView(title: "carbs", value: "\(appetizer.carbs)g")
                    NutritionInfoView(title: "calories", value: "\(appetizer.calories)")
                }
            }
            
            Spacer()
            
            Button {
                print("tapped")
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order").fontWeight(.semibold).frame(width: 200, height: 32)
            }.buttonStyle(.borderedProminent).tint(.accentColor).padding(.bottom, 32)
        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            // close button
            Button {
                isShowingDetail = false
            } label: {
                Image(systemName: "xmark.circle.fill").resizable().foregroundColor(.black).frame(width: 32, height: 32).opacity(0.5).padding()
            }            
        }
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleItem, isShowingDetail: .constant(true))
    }
}
