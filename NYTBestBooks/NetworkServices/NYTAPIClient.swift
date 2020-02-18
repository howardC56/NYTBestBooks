//
//  NYTAPIClient.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import Foundation
import NetworkHelper

struct NYTAPIClient {
    
    // spaces in the category have to be in this format "hardcover-fiction"
    
    static func getBooks(of category: String, completeion: @escaping (Result<[Book], AppError>) -> ()) {
        
        let key = ""
        
        let endpoint = "https://api.nytimes.com/svc/books/v3/lists/current/\(category).json?api-key=\(key)"
        
        guard let url = URL(string: endpoint) else {
            completeion(.failure(.badURL(endpoint)))
            return
        }
        
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completeion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let search = try JSONDecoder().decode(SearchResult.self, from: data)
                    completeion(.success(search.results.books))
                } catch {
                    completeion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
}
