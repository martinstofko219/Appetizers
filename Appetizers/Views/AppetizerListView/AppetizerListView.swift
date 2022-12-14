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
            withAnimation {
                NavigationView {
                    List(viewModel.appetizers, rowContent: { item in
                        AppetizerTile(item: item)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.selectedAppetizer = item
                                    viewModel.isShowingDetail = true
                                }
                            }
                    })
                    .navigationTitle("Appetizers")
                    .listStyle(.plain)
                    .disabled(viewModel.isShowingDetail)
                }
                .task {
                    await viewModel.getAppetizers()
                }
                .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            }
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
                    .transition(.scale)
            }
            
            if viewModel.isLoading {
                ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                .scaleEffect(2)
            }
        }
        .alert(viewModel.alertItem?.title ?? "Error",
               isPresented: $viewModel.isShowingAlert,
               presenting: viewModel.alertItem,
               actions: { alert in Button(alert.dismissButtonText, role: .cancel, action: {}) },
               message: { alert in alert.message }
        )
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
