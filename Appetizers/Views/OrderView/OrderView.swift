//
//  OrderView.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/19/22.
//

import SwiftUI

struct OrderView: View {
    @StateObject var viewModel = OrderViewModel()
    
    @State private var orderItems = MockData.sampleList
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    List {
                        ForEach(orderItems) { item in
                            AppetizerTile(item: item)
                        }
                        .onDelete { indexSet in
                            orderItems.remove(atOffsets: indexSet)
                        }
                    }
            
                    Button {
                        print("order button tapped")
                    } label: {
                        Text("Total - Place My Order").fontWeight(.semibold).frame(height: 32)
                    }.buttonStyle(.bordered).tint(.accentColor).padding(.bottom, 32)
                }
                
                if orderItems.isEmpty {
                    EmptyStateView(imageName: "list.dash", message: "Oh no! Your order is empty.")
                }
            }.navigationTitle("My Order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
