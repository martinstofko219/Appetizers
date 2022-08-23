//
//  AccountView.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/19/22.
//

import SwiftUI

struct AccountView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var birthday = Date()
    @State var extraNapkins = false
    @State var boosterChair = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Information") {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Brithday", selection: $birthday, displayedComponents: .date)
                    Button("Save Changes") {
                        print("Save")
                    }
                }
                
                Section("Requests") {
                    Toggle("Extra Napkins", isOn: $extraNapkins)
                    Toggle("Booster or High Chair", isOn: $boosterChair)
                }
            }
            .navigationTitle("My Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
