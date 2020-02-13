//
//  NYTBestSellerViewCell.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import ImageKit

class NYTBestSellerViewCell: UICollectionViewCell {
    
    
    public lazy var bookImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "book")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.layer.borderWidth = 1.5
        image.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        image.layer.cornerRadius = 10
        return image
    }()
    
    private lazy var rankLabel: UILabel = {
        let label = UILabel()
        label.text = "X"
        label.textAlignment = .center
        label.backgroundColor = .blue
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
    
    private func commonInit() {
        bookImageConstraints()
        rankLabelconstraints()
    }
    
    private func bookImageConstraints() {
        addSubview(bookImage)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bookImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            bookImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            bookImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.90),
            bookImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.70)
        ])
        
    }
    
    private func rankLabelconstraints() {
        addSubview(rankLabel)
        rankLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rankLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            rankLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            rankLabel.heightAnchor.constraint(equalToConstant: 30),
            rankLabel.widthAnchor.constraint(equalTo: rankLabel.heightAnchor)
        ])
        
    }
    
    public func configureCell(book: Book) {
        bookImage.getImage(with: book.bookImage) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("issue with book image, \(appError)")
            case .success(let bookImage):
                self?.bookImage.image = bookImage
            }
        }
        
    }
    
}
