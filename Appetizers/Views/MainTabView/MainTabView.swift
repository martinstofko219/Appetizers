//
//  ContentView.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/19/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            AppetizerListView().tabItem({
                Label("Home", systemImage: "house")
            })
            AccountView().tabItem({
                Label("Account", systemImage: "person")
            })
            OrderView().tabItem({
                Label("Order", systemImage: "bag")
            })
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
