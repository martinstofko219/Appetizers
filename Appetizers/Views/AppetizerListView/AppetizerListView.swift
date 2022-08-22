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
        ZStack {
            NavigationView {
                List(viewModel.appetizers, rowContent: { item in
                    AppetizerTile(item: item)
                }).navigationTitle("Appetizers")
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            
            if viewModel.isLoading {
                ProgressView("Loading appetizers...")
            }
        }
        .alert(viewModel.alertItem?.title ?? "Error",
                isPresented: $viewModel.showingAlert,
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
