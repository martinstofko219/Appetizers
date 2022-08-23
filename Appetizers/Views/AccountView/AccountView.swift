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
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Brithday", selection: $viewModel.birthday, displayedComponents: .date)
                    Button("Save Changes") {
                        viewModel.saveChanges()
                    }
                }
                
                Section("Requests") {
                    Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
                    Toggle("Booster or High Chair", isOn: $viewModel.boosterChair)
                }
            }
            .navigationTitle("My Account")
        }
        .alert(viewModel.alertItem?.title ?? "Error",
                isPresented: $viewModel.isShowingAlert,
                presenting: viewModel.alertItem,
                actions: { alert in Button(alert.dismissButtonText, action: {}) },
                message: { alert in alert.message }
         )
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
