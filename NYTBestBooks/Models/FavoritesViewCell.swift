//
//  FavoritesViewCell.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import ImageKit

protocol FavoritesViewCellDelegate: class {
    func didPressMoreOptionsButton(cell: FavoritesViewCell, book: Book)
}

final class FavoritesViewCell: UICollectionViewCell {
    
    weak var delegate: FavoritesViewCellDelegate?
    private var currentBook: Book!
    
    public lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.image = UIImage(systemName: "photo")
        return image
    }()
    
    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 10
        label.layer.borderColor = UIColor.black.cgColor
        label.text = "SimsSImsSimsSimsSImsSims SimsSImsSims SimsSImsSims SimsSImsSims SimsSImsSims SimsSImsSims SimsSImsSims SimsSImsSims SimsSImsSims SimsSImsSims SimsSImsSims SimsSImsSimsSimsSImsSimsSimsSImsSimsSimsSImsSims"
        return label
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Test"
        return label
    }()
    
    public lazy var moreOptionsButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
        button.backgroundColor = .clear
        button.layer.cornerRadius = 20
        button.setBackgroundImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(moreButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func moreButtonPressed(_ sender: UIButton) {
        animateButtonView(sender)
        delegate?.didPressMoreOptionsButton(cell: self, book: currentBook)
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        commonSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(_ book: Book) {
        currentBook = book
        titleLabel.text = book.title
        if book.description == "" {
            descriptionLabel.text = "New York Times Has No Words For This!"
        } else {
        descriptionLabel.text = book.description
        }
        imageView.getImage(with: book.bookImage) { [ weak self ](result) in
            DispatchQueue.main.async {
                switch result {
                case .failure:
                    self?.imageView.image = UIImage(systemName: "exclamationmark.octagon")
                case .success(let image):
                    self?.imageView.image = image
                }
            }
            
        }
    }
    
    private func commonSetup() {
        imageViewConstraints()
        deleteButtonConstraints()
        titleLabelConstraints()
        descriptionLabelConstraints()
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.5
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        backgroundColor = .white
    }
    
    private func imageViewConstraints() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.centerXAnchor.constraint(equalTo: centerXAnchor), imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10), imageView.widthAnchor.constraint(equalToConstant: 150), imageView.heightAnchor.constraint(equalToConstant: 250)])
    }
    
    private func deleteButtonConstraints() {
        addSubview(moreOptionsButton)
        moreOptionsButton.anchor(top: imageView.topAnchor, right: rightAnchor, paddingRight: 10, width: 24, height: 24)
    }
    
    
    private func titleLabelConstraints() {
        addSubview(titleLabel)
        titleLabel.anchor(top: imageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 25, paddingLeft: 12, paddingRight: 10, height: 20)
    }
    
    private func descriptionLabelConstraints() {
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
    }
    
    
}
