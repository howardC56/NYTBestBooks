//
//  Books.swift
//  NYTBestBooks
//
//  Created by Amy Alsaydi on 2/6/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
    let results: SearchInfo
}

struct SearchInfo: Codable {
    let books: [TopBook]
}

struct TopBook: Codable {
    let rank: Double
    let description: String
    let title: String
    let author: String
    let bookImage: String
    let bookLinks: [BuyLink]
    
    private enum CodingKeys: String, CodingKey {
        case rank
        case description
        case title
        case author
        case bookImage = "book_image"
        case bookLinks = "buy_links"
    }
}

struct BuyLink: Codable {
    let name: String
    let url: String
}
