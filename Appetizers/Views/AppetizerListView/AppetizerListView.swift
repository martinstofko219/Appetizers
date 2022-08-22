//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/19/22.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.appetizers, rowContent: { item in
                AppetizerTile(item: item)
            }).navigationTitle("Appetizers")
        }
        .onAppear {
            viewModel.getAppetizers()
        }
        .alert(viewModel.alertItem?.title ?? "Error",
               isPresented: $viewModel.showAlert,
               presenting: viewModel.alertItem,
               actions: { alert in Button(alert.dismissButtonText, action: {}) },
               message: { alert in alert.message }
        )
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
