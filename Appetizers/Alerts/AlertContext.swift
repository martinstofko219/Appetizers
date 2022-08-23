//
//  AlertContext.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/21/22.
//

import SwiftUI

struct AlertContext {
    //MARK: Network Alerts
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
    
    //MARK: Validation Alerts
    static let invalidEmail = AlertItem(
        title: "Invalid Email",
        message: Text("Please enter a valid email address."),
        dismissButtonText: "Ok")
    
    static let invalidForm = AlertItem(
        title: "Missing Required Fields",
        message: Text("Please make sure you fill out all fields."),
        dismissButtonText: "Ok")
}
