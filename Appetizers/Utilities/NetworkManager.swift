//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Tushar Jaunjalkar on 10/11/23.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    private init () {}
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"

    func getAppetizer(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL1))
                return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidResponse))
            }
        }
        task.resume()
    }
    
    
    func downloadImage(formString urlString: String, completion: @escaping (UIImage?) -> Void) {
        let chacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: chacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let imageData = UIImage(data: data) else {
                completion(nil)
                return
            }
            self.cache.setObject(imageData, forKey: chacheKey)
        }
        task.resume()
    }
}


/// APError
enum APError: Error {
    case invalidURL1
    case invalidResponse
    case invalidData
    case unableToComplete
}
