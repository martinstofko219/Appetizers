//
//  Order.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/23/22.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        //using numbered args shorthand
        items.reduce(0) { $0 + $1.price }
        
        // longer form
//        items.reduce(0) { partialResult, appetizer in
//            partialResult + appetizer.price
//        }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func remove(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
