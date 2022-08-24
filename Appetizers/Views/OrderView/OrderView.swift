//
//  OrderView.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/19/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    @StateObject var viewModel = OrderViewModel()
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack() {
                    List {
                        ForEach(order.items) { item in
                            AppetizerTile(item: item)
                        }
                        .onDelete { indexSet in
                            order.remove(at: indexSet)
                        }
                        HStack {
                            Spacer()
                            Text("Order Total: $\(order.totalPrice, specifier: "%.2f")")
                                .font(.title3).fontWeight(.bold).padding()
                        }
                    }
            
                    Button {
                        print("order button tapped")
                    } label: {
                        Text("Place My Order").fontWeight(.semibold).frame(height: 32)
                    }.buttonStyle(.bordered).tint(.accentColor).padding(.bottom, 32)
                }
                
                if order.items.isEmpty {
                    EmptyStateView(imageName: "list.dash", message: "Oh no! Your order is empty.")
                }
            }.navigationTitle("My Order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
