//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/21/22.
//

import SwiftUI

@MainActor
final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var selectedAppetizer: Appetizer?
    @Published var isShowingDetail = false
    
    @Published var isShowingAlert: Bool = false
    @Published var alertItem: AlertItem?
    
    @Published var isLoading: Bool = false
    
    func getAppetizers() async {
        isLoading = true
        
        do {
            appetizers = try await NetworkManager.shared.getAppetizers()
            isLoading = false
        } catch {
            alertItem = AlertContext.genericNetworkError
            isLoading = false
            isShowingAlert = true
        }
    }
    
    //    func getAppetizers() {
    //        isLoading = true
    //
    //        NetworkManager.shared.getAppetizers { result in
    //            DispatchQueue.main.async { [self] in
    //                isLoading = false
    //
    //                switch result {
    //                case .success(let appetizers):
    //                    self.appetizers = appetizers
    //                case .failure(let error):
    //                    isShowingAlert = true
    //                    switch error {
    //                    case .invalidURL:
    //                        alertItem = AlertContext.genericNetworkError
    //                    case .invalidResponse:
    //                        alertItem = AlertContext.invalidResponse
    //                    case .invalidData:
    //                        alertItem = AlertContext.invalidData
    //                    case .unableToComplete:
    //                        alertItem = AlertContext.genericNetworkError
    //                    }
    //                }
    //            }
    //        }
    //    }
}
