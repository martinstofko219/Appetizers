//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/21/22.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var showingAlert: Bool = false
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    
    func getAppetizers() {
        isLoading = true
        
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    showingAlert = true
                    switch error {
                    case .invalidURL:
                        alertItem = AlertContext.genericNetworkError
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.genericNetworkError
                    }
                }
            }
        }
    }
}
