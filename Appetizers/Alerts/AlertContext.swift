//
//  AlertContext.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/21/22.
//

import SwiftUI

struct AlertContext {
    static let genericNetworkError = AlertItem(
        title: "Network Error",
        message: Text("Could not connect. Please check your internet connection."),
        dismissButtonText: "Ok")
    
    static let invalidResponse = AlertItem(
        title: "Network Error",
        message: Text("There was an issue communicating with the server. Please try again later."),
        dismissButtonText: "Ok")
    
    static let invalidData = AlertItem(
        title: "Network Error",
        message: Text("There was an issue retrieving the data. Please try again later."),
        dismissButtonText: "Ok")
}
