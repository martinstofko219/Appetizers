//
//  Alert.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/21/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: Text
    let dismissButtonText: String
}
