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
    
    public lazy var outterView: UIView = {
        let outerView = UIView()
        outerView.backgroundColor = .white
        outerView.layer.masksToBounds = false
        outerView.clipsToBounds = false
        outerView.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) //UIColor.black.cgColor
        outerView.layer.shadowOpacity = 0.8
        outerView.layer.shadowOffset = CGSize.zero
        outerView.layer.shadowRadius = 15
        outerView.layer.cornerRadius = 8
     
        return outerView
    }()
    
    public lazy var bookImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "book")
        image.clipsToBounds = true //
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
   
        return image
    }()
    
    private lazy var rankLabel: UILabel = {
        let label = UILabel()
        label.text = "X"
        label.textAlignment = .center
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
        outterViewConstraints()
        bookImageConstraints()
        rankLabelconstraints()
    }
    
    private func outterViewConstraints() {
        addSubview(outterView)
        outterView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            outterView.centerYAnchor.constraint(equalTo: centerYAnchor),
            outterView.centerXAnchor.constraint(equalTo: centerXAnchor),
            outterView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.90),
            outterView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.70)
        ])
        
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
        rankLabel.text = book.rank.description
        
        bookImage.getImage(with: book.bookImage) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("issue with book image, \(appError)")
            case .success(let bookImage):
                DispatchQueue.main.async {
                    self?.bookImage.image = bookImage
                }
                
            }
        }
        
    }
    
}
