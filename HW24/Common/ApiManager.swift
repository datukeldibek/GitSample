//
//  ApiManager.swift
//  HW24
//
//  Created by Jarae on 30/3/23.
//

import Foundation


class APIManager {
    
    static let shared = APIManager()
    
    let urlString = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8a10cb9a44ed497196ccf0833200a4e9"
    
    func getData(completion: @escaping (Result<NewsData, Error>) -> Void) {
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            
        
            
            do {
                let newsData = try JSONDecoder().decode(NewsData.self, from: data)
                completion(.success(newsData))
                print("success")
            } catch {
                print("failure")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
