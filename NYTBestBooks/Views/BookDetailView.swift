//
//  BookDetailView.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class BookDetailView: UIView {
    
   
    
    public lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = .black
        return button
       
    }()

    public lazy var bookImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    } ()
    
    public lazy var authorLabel: UILabel = {
              let label = UILabel()
              label.numberOfLines = 2
              label.font = UIFont.preferredFont(forTextStyle: .subheadline)
              label.text = "Author"
              
              return label
          }()
    
    public lazy var rankLabel: UILabel = {
              let label = UILabel()
              label.numberOfLines = 1
              label.font = UIFont.preferredFont(forTextStyle: .subheadline)
              label.text = "Rank"
              
              return label
          }()
    
    public lazy var weeksOnListLabel: UILabel = {
              let label = UILabel()
              label.numberOfLines = 1
              label.font = UIFont.preferredFont(forTextStyle: .subheadline)
              label.text = "Weeks on list"
              
              return label
          }()
    
    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
            label.numberOfLines = 5
            label.text = "Description DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription"
        // Just wanna see what it looks like with a description with one line
            
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
        setupFavoriteButton()
        setupTitleLabel()
        setupImageView()
        setupAuthorLabel()
        setupRankLabel()
        setupWeeksOnListLabel()
        setupDescriptionLabel()
        backgroundColor = .white
    }
    
    private func setupFavoriteButton() {
        addSubview(favoriteButton)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupTitleLabel() {
           
           addSubview(titleLabel)
           titleLabel.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
           
       }
    private func setupImageView() {
        addSubview(bookImage)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            bookImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            //TODO: Use multiplier to set height and width so that the size of the book changes with the size of the device.
            bookImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.40),
            bookImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.50)
        ])
    }
    
   
    
    private func setupAuthorLabel() {
        addSubview(authorLabel)
       authorLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: favoriteButton.bottomAnchor, constant: 50),
            authorLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 10),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        
    }
    private func setupRankLabel() {
        addSubview(rankLabel)
        rankLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rankLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            rankLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 10),
            rankLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)])
    }
    
    private func setupWeeksOnListLabel() {
        addSubview(weeksOnListLabel)
        weeksOnListLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weeksOnListLabel.topAnchor.constraint(equalTo: rankLabel.bottomAnchor, constant: 8),
            weeksOnListLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 10),
            weeksOnListLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    

    
}
