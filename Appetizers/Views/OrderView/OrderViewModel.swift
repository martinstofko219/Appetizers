//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/22/22.
//

import Foundation

final class OrderViewModel: ObservableObject {
    @Published var order: [Appetizer] = []
}
