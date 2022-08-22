//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/21/22.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var showAlert: Bool = false
    @Published var alertItem: AlertItem?
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    showAlert = true
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
