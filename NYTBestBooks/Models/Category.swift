//
//  Categories.swift
//  NYTBestBooks
//
//  Created by Lilia Yudina on 2/7/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

struct Category: Codable & Equatable {
    let status: String
    let results: [Categories]
}

struct Categories: Codable & Equatable {
    let listName: String
    let displayName: String
//    let listNameEncoded: String
//    let oldestPublishedDate: String
//    let newestPublishedDate: String
    let updated: String
    
    private enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case displayName = "display_name"
//        case listNameEncoded = "list_name_encoded"
//        case oldestPublishedDate = "oldest_published_date"
//        case newestPublishedDate = "newest_published_date"
        case updated
    }
}
