//
//  Book.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

struct SearchResult: Codable & Equatable {
    let results: SearchInfo
}

struct SearchInfo: Codable & Equatable {
    let listName: String
    let books: [Book]
    
    private enum CodingKeys: String, CodingKey {
    case listName = "list_name"
    case books
    }
}

struct Book: Codable & Equatable {
    let rank: Int
    let description: String
    let title: String
    let author: String
    let bookImage: String
    let bookLinks: [BuyLink]
    let weeksOnList: Double
    
    private enum CodingKeys: String, CodingKey {
        case rank
        case description
        case title
        case author
        case bookImage = "book_image"
        case bookLinks = "buy_links"
        case weeksOnList = "weeks_on_list"
    }
}

struct BuyLink: Codable & Equatable {
    let name: String
    let url: String
}

