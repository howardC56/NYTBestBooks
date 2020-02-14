//
//  FavoritesView.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

final class FavoritesView: UIView {
    
    override init(frame: CGRect ) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var collectionview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: frame.width / 1.2, height: frame.height / 1.5)
        layout.sectionInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    private func commonInit() {
        collectionviewConstraints()
    }
    
    private func collectionviewConstraints() {
        addSubview(collectionview)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor), collectionview.leadingAnchor.constraint(equalTo: leadingAnchor), collectionview.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor), collectionview.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
    }
    
}

