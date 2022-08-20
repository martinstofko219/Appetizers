//
//  OrderView.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/19/22.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView{
            Text("Order View").navigationTitle("My Order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
