//
//  Alert.swift
//  Appetizers
//
//  Created by Tushar Jaunjalkar on 10/11/23.
//

import Foundation
import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dissmissButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(title: Text("Server Error"),
                                      message: Text("Data revived from server invalid"),
                                      dissmissButton: .default(Text("Ok")))
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                      message: Text("Data revived from server invalid"),
                                      dissmissButton: .default(Text("Ok")))

    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("Data revived from server invalid"),
                                      dissmissButton: .default(Text("Ok")))

    static let unableToConect = AlertItem(title: Text("Server Error"),
                                      message: Text("Data revived from server invalid"),
                                      dissmissButton: .default(Text("Ok")))

}
