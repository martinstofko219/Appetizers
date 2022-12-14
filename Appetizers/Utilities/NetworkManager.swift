//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/21/22.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersURL = baseURL + "appetizers"
    
    private init() {}
    
    //    func getAppetizers(completed: @escaping (Result<[Appetizer], AppError>) -> Void) {
    //        guard let url = URL(string: appetizersURL) else {
    //            completed(.failure(.invalidURL))
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: url) { data, response, error in
    //            if let _ = error {
    //                completed(.failure(.unableToComplete))
    //                return
    //            }
    //
    //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //                completed(.failure(.invalidResponse))
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completed(.failure(.invalidData))
    //                return
    //            }
    //
    //            do {
    //                let decoder = JSONDecoder()
    //                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
    //                completed(.success(decodedResponse.request))
    //            } catch {
    //                completed(.failure(.invalidData))
    //            }
    //        }
    //        task.resume()
    //    }
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizersURL) else {
            throw AppError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decodedResponse = try JSONDecoder().decode(AppetizerResponse.self, from: data)
            return decodedResponse.request
        } catch {
//            if let appError = error as? AppError {
//                // our custom error was thrown; can handle different cases
//            } else {
//                // generic error
//            }
            throw AppError.invalidData
        }
    }
    
    func getAppetizerImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        // check the cache first
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [self] data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            // put image in the cache
            cache.setObject(image, forKey: cacheKey)
            
            completed(image)
        }
        task.resume()
    }
}
