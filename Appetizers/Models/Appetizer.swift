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
    static let sampleItem = Appetizer(id: 1, name: "Sample Appetizer One", description: "Description for our yummy sample appetizer one.", imageURL: "", price: 9.99, protein: 20, carbs: 35, calories: 475)
    static let sampleItem2 = Appetizer(id: 2, name: "Sample Appetizer Two", description: "Description for our yummy sample appetizer two.", imageURL: "", price: 4.95, protein: 8, carbs: 40, calories: 515)
    static let sampleItem3 = Appetizer(id: 3, name: "Sample Appetizer Three", description: "Description for our yummy sample appetizer three.", imageURL: "", price: 5.95, protein: 40, carbs: 10, calories: 387)
    
    static let sampleList = [sampleItem, sampleItem2, sampleItem3]
}
