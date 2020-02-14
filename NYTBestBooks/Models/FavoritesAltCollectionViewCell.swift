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
         let button = UIButton(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(pressedBook), for: .touchUpInside)
         return button
     }()
    
    @objc private func pressedBook(_ sender: UIButton) {
        delegate?.didPressBookButton(cell: self, book: currentBook)
    }
    
    private func commonSetup() {
        bookButtonConstraints()
    }
    
    public func configCell(_ book: Book) {
        currentBook = book
        let imageView = UIImageView()
        imageView.getImage(with: book.bookImage) { [ weak self ](result) in
                   DispatchQueue.main.async {
                       switch result {
                       case .failure:
                        self?.bookButton.setImage(UIImage(systemName: "exclamationmark.octagon"), for: .normal)
                       case .success(let image):
                        self?.bookButton.setImage(image, for: .normal)
                       }
                   }
                   
               }
    }
    
    private func bookButtonConstraints() {
        addSubview(bookButton)
        bookButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([bookButton.centerYAnchor.constraint(equalTo: centerYAnchor), bookButton.centerXAnchor.constraint(equalTo: centerXAnchor), bookButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75), bookButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75)])
    }
    
}
