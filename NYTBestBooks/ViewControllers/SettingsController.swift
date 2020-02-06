//
//  SettingsController.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

struct AppKey {
    static let appCategoryKey = "app categories"
}

class SettingsController: UIViewController {
    
    private let settingsView = SettingView()
    
    override func loadView() {
          view = settingsView
         
      }
      

    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.navigationItem.title = "Settings"
        //navigationItem.title = "Settings"
        view.backgroundColor = .systemBackground
       
        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
    }
    
 private let categories = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "Q", "L", "M", "N", "O", "P"]

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
        return categories[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let categoryName = categories[row]
        UserDefaults.standard.set(categoryName, forKey: AppKey.appCategoryKey)
    }
}
