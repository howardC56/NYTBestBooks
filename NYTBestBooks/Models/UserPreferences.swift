//
//  UserPreferences.swift
//  NYTBestBooks
//
//  Created by Amy Alsaydi on 2/14/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import Foundation

// ADDITION: created a UserPreference class and UserPreferenceDelegate to update and listen to changes
// on UserDefaults
// this way we do not have to always call viewWillAppear() to check and reload our fetchStories()

struct UserKey {
  static let categoryName = "Category"
    static let categoryRow = "Category Row"
}

protocol UserPreferenceDelegate: AnyObject {
  func didChangeCategory(_ userPreference: UserPreference, category: String)
}

final class UserPreference {
  weak var delegate: UserPreferenceDelegate?
  
  public func getCategoryName() -> String? {
    return UserDefaults.standard.object(forKey: UserKey.categoryName) as? String
  }
    
    public func getCategoryRow() -> Int? {
       return UserDefaults.standard.object(forKey: UserKey.categoryRow) as? Int
     }
    
  
    public func setCategoryName(_ categoryName: String, row: Int) {
        UserDefaults.standard.set(categoryName, forKey: UserKey.categoryName)
        UserDefaults.standard.set(row, forKey: UserKey.categoryRow)
    delegate?.didChangeCategory(self, category: categoryName)
  }
}
