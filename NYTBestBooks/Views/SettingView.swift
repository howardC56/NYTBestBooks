//
//  SettingView.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class SettingView: UIView {

   public lazy var pickerView: UIPickerView = {
          let pv = UIPickerView()
          return pv
      }()
      
      override init(frame: CGRect) {
          super.init(frame: UIScreen.main.bounds)
          commonInit()
      }
      
      required init?(coder: NSCoder) {
          super.init(coder: coder)
          commonInit()
      }
      private func commonInit() {
          setupPickerViewConstraints()
         
      }
      
      private func setupPickerViewConstraints() {
          addSubview(pickerView)
          pickerView.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              pickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
              pickerView.centerYAnchor.constraint(equalTo: centerYAnchor)
          ])
      }


}
