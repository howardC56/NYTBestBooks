//
//  SettingView.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class SettingView: UIView {
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.text = "Categories:"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Select a category below"
        
        label.font = UIFont(name: "PingFang HK", size: 15)
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
        setupTitleLabelConstraints()
        setupDescriptionLabelConstraints()
        setupPickerViewConstraints()
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
    
    private func setupDescriptionLabelConstraints() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }

      private func setupPickerViewConstraints() {
          addSubview(pickerView)
          pickerView.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              pickerView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
              pickerView.leadingAnchor.constraint(equalTo: leadingAnchor),
              pickerView.trailingAnchor.constraint(equalTo: trailingAnchor)
          ])
      }


}
