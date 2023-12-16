//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Tushar Jaunjalkar on 10/11/23.
//

import Foundation

class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers:[Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    func getAppetizer() {
        isLoading = true
        NetworkManager.shared.getAppetizer { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appetizer):
                    self.appetizers = appetizer
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidURL1:
                        self.alertItem = AlertContext.invalidURL
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToConect
                    }
                }
            }
        }
    }
}
