//
//  CategoryCell.swift
//  NYTBestBooks
//
//  Created by Amy Alsaydi on 2/13/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.thin)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override var isSelected: Bool{
        willSet{
            super.isSelected = newValue
            if newValue
            {
                self.layer.borderWidth = 1.0
                self.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                self.layer.borderColor = UIColor.white.cgColor
            }
            else
            {
                self.layer.borderWidth = 0.0
                 self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                self.layer.cornerRadius = 0.0
            }
        }
    }
    
    private func commonInit() {
        catergoryLabelConstraints()
    }
    
    private func catergoryLabelConstraints() {
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            categoryLabel.widthAnchor.constraint(equalTo: widthAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryLabel.heightAnchor.constraint(equalTo: heightAnchor)
        ])
        
        
    }
    
    public func configureCell(category: Categories) {
        categoryLabel.text = category.listName
    }
    
}
