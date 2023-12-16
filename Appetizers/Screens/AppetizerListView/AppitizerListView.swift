//
//  AppitizerListView.swift
//  Appetizers
//
//  Created by Tushar Jaunjalkar on 10/11/23.
//

import SwiftUI

struct AppitizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { apptizer in
                    AppetizerCell(appetizer: apptizer)
                }
                .navigationTitle("Appetizer")
            }
            .onAppear {
                viewModel.getAppetizer()
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dissmissButton)
        }
    }
}

struct AppitizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppitizerListView()
    }
}
