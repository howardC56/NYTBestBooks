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
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore the books that are top of the charts."
        label.font = UIFont(name: "PingFang HK", size: 15)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
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
        labelConstraints()
        collectionConstraints()
        sideMenuComstraints()
    }

    private func labelConstraints() {
        addSubview(commentLabel)
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            commentLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            commentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            commentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
            //commentLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func collectionConstraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor),
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
