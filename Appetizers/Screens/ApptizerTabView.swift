//
//  ContentView.swift
//  Appetizers
//
//  Created by Tushar Jaunjalkar on 10/11/23.
//

import SwiftUI

struct ApptizerTabView: View {
    var body: some View {
        TabView {
            AppitizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(Color.brandColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ApptizerTabView()
    }
}
