//
//  OrderView.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/19/22.
//

import SwiftUI

struct OrderView: View {
    @StateObject var viewModel = OrderViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                List {
                    Text("appetizers here")
                }
                
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    Text("Purchase").fontWeight(.semibold).frame(width: 200, height: 32)
                }.buttonStyle(.bordered).tint(.accentColor).padding(.bottom, 32)
            }
            .navigationTitle("My Order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
