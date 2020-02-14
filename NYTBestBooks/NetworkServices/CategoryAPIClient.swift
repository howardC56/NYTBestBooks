//
//  CategoryAPIClient.swift
//  NYTBestBooks
//
//  Created by Lilia Yudina on 2/7/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import Foundation
import NetworkHelper

struct CategoryAPIClient {
  static func fetchCategories(completion: @escaping (Result<[Categories], AppError>) -> ()) {
    let appKey = ""
    let endpointURLString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(appKey)"
    guard let url = URL(string: endpointURLString) else {
      completion(.failure(.badURL(endpointURLString)))
      return
    }
    let request = URLRequest(url: url)
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure(let appError):
        completion(.failure(.networkClientError(appError)))
      case .success(let data):
        do {
          let categories = try JSONDecoder().decode(Category.self, from: data)
            completion(.success(categories.results))
        } catch {
          completion(.failure(.decodingError(error)))
        }
      }
    }
  }
}

