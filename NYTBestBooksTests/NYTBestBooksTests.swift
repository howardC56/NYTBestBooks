//
//  NYTBestBooksTests.swift
//  NYTBestBooksTests
//
//  Created by Amy Alsaydi on 2/6/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import XCTest

@testable import NYTBestBooks

class NYTBestBooksTests: XCTestCase {

    func testApiClient() {
        let expectedCount = 15
        let category = "hardcover-fiction"
        let exp = XCTestExpectation(description: "books found")

        
        NYTAPIClient.getBooks(of: category) { (result) in
            switch result {
            case .failure(let appError):
                XCTFail("\(appError)")
            case .success(let books):
                XCTAssertEqual(books.count, expectedCount)
                exp.fulfill()
            }
        }
        wait(for:[exp], timeout: 5.0)
    }

}
