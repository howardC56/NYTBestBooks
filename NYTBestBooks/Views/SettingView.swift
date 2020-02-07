//
//  SettingView.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class SettingView: UIView {
    
    let title = "Settings"
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.textAlignment = .center
        label.text = title
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

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
         setupTitleLabelConstraints()
      }
      
    private func setupTitleLabelConstraints() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
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
