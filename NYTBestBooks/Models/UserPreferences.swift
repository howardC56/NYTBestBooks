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
}

protocol UserPreferenceDelegate: AnyObject {
  func didChangeNewsSection(_ userPreference: UserPreference, sectionName: String)
}

final class UserPreference {
  weak var delegate: UserPreferenceDelegate?
  
  public func getSectionName() -> String? {
    return UserDefaults.standard.object(forKey: UserKey.categoryName) as? String
  }
  
  public func setSectionName(_ sectionName: String) {
    UserDefaults.standard.set(sectionName, forKey: UserKey.categoryName)
    delegate?.didChangeNewsSection(self, sectionName: sectionName)
  }
}
