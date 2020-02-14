//
//  EmptyFavoritesView.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/11/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//
import UIKit

final class EmptyFavoritesView: UIView {
    
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
    emitBooks()
   }
    
    private func emitBooks() {
           let emitter = Emitter.get(with: #imageLiteral(resourceName: "leatherBook"))
           emitter.emitterPosition = CGPoint(x: frame.width / 2, y: 5)
           emitter.emitterSize = CGSize(width: frame.width, height: 2)
           layer.addSublayer(emitter)
       }
   
    private func backgroundImageConstraints() {
    addSubview(backgroundImage)
        backgroundImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
}
