//
//  AccountView.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/19/22.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Information") {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Brithday", selection: $viewModel.user.birthday, displayedComponents: .date)
                }
                
                Section("Requests") {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Booster or High Chair", isOn: $viewModel.user.boosterChair)
                }
                
                Button("Save Changes") {
                    viewModel.saveChanges()
                }
            }
            .navigationTitle("My Account")
        }
        .onAppear {
            viewModel.getUserFromAppStorage()
        }
        .alert(viewModel.alertItem?.title ?? "Error",
               isPresented: $viewModel.isShowingAlert,
               presenting: viewModel.alertItem,
               actions: { alert in Button(alert.dismissButtonText, role: .cancel, action: {}) },
               message: { alert in alert.message }
        )
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
