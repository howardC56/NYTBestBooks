//
//  sidebarView.swift
//  NYTBestBooks
//
//  Created by Amy Alsaydi on 2/13/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class SidebarView: UIView {
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = """
        
           CATEGORIES:
        
        """
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.backgroundColor = .black
        label.numberOfLines = 0
        return label
    }()

 public var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .black
        return cv
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
        categoryLabelConstraints()
        collectionConstraints()
    }
    
    private func categoryLabelConstraints() {
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
    }
    
    private func collectionConstraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
