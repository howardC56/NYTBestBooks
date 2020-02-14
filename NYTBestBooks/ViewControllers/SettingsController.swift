//
//  SettingsController.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

//struct AppKey {
//    static let appCategoryKey = "app categories"
//}

class SettingsController: UIViewController {
    
    private let settingsView = SettingView()
    private var  userPreference:  UserPreference
    
    override func loadView() {
          view = settingsView
         
      }
    
    init(userPreference: UserPreference) {
        self.userPreference = userPreference
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
      

    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.navigationItem.title = "Settings"
        //navigationItem.title = "Settings"
        view.backgroundColor = .systemBackground
       
        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
        fetchCategory()
    }
    
    private var categories = [Categories]() {
        didSet {
            DispatchQueue.main.async {
                self.settingsView.pickerView.reloadAllComponents()
            }
        }
    }
    
    private func fetchCategory() {
        CategoryAPIClient.fetchCategories() { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error fetching categories: \(appError)")
            case .success(let categories):
                self?.categories = categories
            }
        }
    }

}

extension SettingsController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
}

extension SettingsController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].listName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let categoryName = categories[row].listName
        userPreference.setSectionName(categoryName.replacingOccurrences(of: " ", with: "-"))
    }
}
