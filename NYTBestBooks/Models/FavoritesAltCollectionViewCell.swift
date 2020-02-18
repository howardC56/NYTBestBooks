//
//  FavoritesAltCollectionViewCell.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/13/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import ImageKit

protocol FavoritesAltViewCellDelegate: class {
    func didPressBookButton(cell: FavoritesAltCollectionViewCell, book: Book)
}

final class FavoritesAltCollectionViewCell: UICollectionViewCell {
 
      weak var delegate: FavoritesAltViewCellDelegate?
      private var currentBook: Book!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundView = UIImageView(image: UIImage(named: "bookshelf"))
        commonSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var bookButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.size.width / 2 , height: self.frame.size.height / 2))
        button.imageView?.clipsToBounds = true
        button.addTarget(self, action: #selector(pressedBook), for: .touchUpInside)
         return button
     }()
    
    @objc private func pressedBook(_ sender: UIButton) {
        animateButtonView(sender)
        delegate?.didPressBookButton(cell: self, book: currentBook)
    }
    
    private func commonSetup() {
        bookButtonConstraints()
    }
    
    public func configCell(_ book: Book) {
        currentBook = book
        let imageView = UIImageView()
        imageView.getImage(with: book.bookImage) { [ weak self ] (result) in
                   DispatchQueue.main.async {
                       switch result {
                       case .failure:
                        self?.bookButton.setImage(UIImage(systemName: "exclamationmark.octagon"), for: .normal)
                       case .success(let image):
                        self?.bookButton.setImage(image, for: .normal)
                        self?.bookButton.layer.cornerRadius = 10
                        self?.bookButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                        self?.bookButton.layer.shadowRadius = 10
                        self?.bookButton.layer.shadowOffset = .zero
                        self?.bookButton.layer.shadowOpacity = 0.75
                        self?.bookButton.layer.shadowPath = UIBezierPath(rect: self?.bookButton.imageView?.frame ?? CGRect(x: 0, y: 0, width: 0, height: 0)).cgPath
                       }
                   }
               }
    }
    
    private func bookButtonConstraints() {
        addSubview(bookButton)
        bookButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([bookButton.centerYAnchor.constraint(equalTo: centerYAnchor), bookButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    
}

