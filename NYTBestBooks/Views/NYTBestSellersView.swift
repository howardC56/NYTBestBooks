//
//  NYTBestSellersView.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class NYTBestSellersView: UIView {
    
    public var sideMenuWidth: NSLayoutConstraint?
    
    public var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.isPagingEnabled = true
        return cv
    }()
    
    public var sideMenu: SidebarView = {
        let view = SidebarView()
        return view
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
        sideMenuComstraints()
    }

    private func collectionConstraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.60)
        ])
    }
    
    private func sideMenuComstraints() {
        addSubview(sideMenu)
        sideMenu.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sideMenu.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            sideMenu.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            sideMenu.leadingAnchor.constraint(equalTo: leadingAnchor),
            sideMenu.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        sideMenuWidth = sideMenu.widthAnchor.constraint(equalToConstant: 0)
        sideMenuWidth?.isActive = true
    }

}
