//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/22/22.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthday = Date()
    @Published var extraNapkins = false
    @Published var boosterChair = false
    
    @Published var alertItem: AlertItem?
    @Published var isShowingAlert = false
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            isShowingAlert = true
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            isShowingAlert = true
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        print("Changes saved!")
    }
}
