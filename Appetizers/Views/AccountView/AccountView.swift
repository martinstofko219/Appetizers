//
//  AccountView.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/19/22.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView{
            Text("Account View").navigationTitle("My Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
