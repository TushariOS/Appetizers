//
//  Appetizer.swift
//  Appetizers
//
//  Created by Tushar Jaunjalkar on 10/11/23.
//

import Foundation

/*
 request: [
 {
 name: "Asian Flank Steak",
 calories: 300,
 price: 8.99,
 id: 1,
 protein: 14,
 imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
 carbs: 0,
 description: "This perfectly thin cut just melts in your mouth."
 },
 */
struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let protein: Int
    let carbs: Int
    let calories: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
    
//    enum codeingKey: CodingKeys, String {
//        case request:
//    }
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 1,
                                           name: "test",
                                           description: "This is test description",
                                           price: 9.99,
                                           imageURL: "",
                                           protein: 99,
                                           carbs: 99,
                                           calories: 200)
    static let appetizer: [Appetizer] = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
