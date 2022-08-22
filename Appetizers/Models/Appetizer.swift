//
//  Appetizer.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/20/22.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    let price: Double
    let protein: Int
    let carbs: Int
    let calories: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleItem = Appetizer(id: 1, name: "Sample Appetizer", description: "Description for our yummy sample appetizer.", imageURL: "", price: 9.99, protein: 20, carbs: 35, calories: 475)
    
    static let sampleList = [sampleItem, sampleItem, sampleItem, sampleItem]
}
