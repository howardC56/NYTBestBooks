//
//  NYTBestSellersView.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class NYTBestSellersView: UIView {
    
    public lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Category", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        return button
    }()
    
    private var collectionView: UICollectionView = {
       let cv = UICollectionView()
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
        collectionConstraints()
        buttonConstraints()
    }

    private func collectionConstraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.70)
        ])
    }
    
    private func buttonConstraints() {
        addSubview(moreButton)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moreButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 10),
            moreButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            moreButton.heightAnchor.constraint(equalTo:  heightAnchor, multiplier: 0.15),
            moreButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.60)
            
        ])
    }
  

}
