//
//  EmptyFavoritesView.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/11/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//
import UIKit

class EmptyFavoritesView: UIView {
    
    private var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "library")
        return image
    }()

    init() {
       super.init(frame: UIScreen.main.bounds)
       commonInit()
        backgroundImage.image = UIImage(named: "library")
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   private func commonInit() {
    backgroundImageConstraints()
   }
    
   
    private func backgroundImageConstraints() {
    addSubview(backgroundImage)
        backgroundImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
}
