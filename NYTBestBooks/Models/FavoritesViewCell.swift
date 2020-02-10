//
//  FavoritesViewCell.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

final class FavoritesViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var genreRankText: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var moreOptionsButton: UIButton = {
           let button = UIButton(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
             button.backgroundColor = .clear
             button.layer.cornerRadius = 20
             button.setBackgroundImage(UIImage(systemName: "ellipsis"), for: .normal)
             button.tintColor = .black
             button.animateButtonView(button)
        return button
    }()
    
    override init(frame: CGRect) {
           super.init(frame:frame)
           commonSetup()
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(_ book: Book) {
        
    }
    
   private func commonSetup() {
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.5
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
//        layer.shouldRasterize = true
//        layer.rasterizationScale = UIScreen.main.scale
        backgroundColor = .white
        imageViewConstraints()
        deleteButtonConstraints()
        rankLabelConstraints()
        titleLabelConstraints()
        descriptionLabelConstraints()
    }
    
    private func imageViewConstraints() {
           addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 10, width: 124, height: 70)
       }
    
    private func deleteButtonConstraints() {
           moreOptionsButton.anchor(top: topAnchor, right: rightAnchor, paddingTop: 10, paddingRight: 10, width: 20, height: 20)
       }
    
    private func rankLabelConstraints() {
        addSubview(genreRankText)
        genreRankText.anchor(top: moreOptionsButton.topAnchor, left: imageView.rightAnchor, right: rightAnchor, paddingTop: 14, paddingLeft: 12, paddingRight: 10, height: 16)
    }
    
    private func titleLabelConstraints() {
        addSubview(titleLabel)
        titleLabel.anchor(top: genreRankText.bottomAnchor, left: imageView.rightAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 12, paddingRight: 10, height: 20)
    }
    
    private func descriptionLabelConstraints() {
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
    }
    
    
}
