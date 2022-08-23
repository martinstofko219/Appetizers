//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/22/22.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    // DISCLAIMER - we would not store a user object in AppStorage in a real app
    //            - for educational purposes only to use AppStorage
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    
    @Published var alertItem: AlertItem?
    @Published var isShowingAlert = false
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            isShowingAlert = true
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            isShowingAlert = true
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            isShowingAlert = true
            alertItem = AlertContext.userSaveSuccess
        } catch {
            isShowingAlert = true
            alertItem = AlertContext.userSaveFailure
        }
    }
    
    func getUserFromAppStorage() {
        guard let data = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: data)
        } catch {
            isShowingAlert = true
            alertItem = AlertContext.userGetFailure
        }
    }
}
