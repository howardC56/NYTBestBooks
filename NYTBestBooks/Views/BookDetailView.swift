//
//  BookDetailView.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class BookDetailView: UIView {

    public lazy var bookImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Author"
        label.numberOfLines = 2
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
            label.numberOfLines = 0
            label.text = "Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description "
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
        setupImageView()
        setupTitleLabel()
        setupAuthorLabel()
        setupRankLabel()
        setupWeeksOnListLabel()
        setupDescriptionLabel()
    }
    
    private func setupImageView() {
        addSubview(bookImage)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            bookImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            //TODO: Use multiplier to set height and width so that the size of the book changes with the size of the device.
            bookImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.40),
            bookImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.40)
        ])
    }
    
    private func setupTitleLabel() {
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)])
        
    }
    
    private func setupAuthorLabel() {
        addSubview(authorLabel)
       authorLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)])
        
        
    }
    private func setupRankLabel() {
        addSubview(rankLabel)
        rankLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rankLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            rankLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            rankLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)])
    }
    
    private func setupWeeksOnListLabel() {
        addSubview(weeksOnListLabel)
        weeksOnListLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weeksOnListLabel.topAnchor.constraint(equalTo: rankLabel.bottomAnchor, constant: 8),
            weeksOnListLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            weeksOnListLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)])
    }
    
    private func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 15),
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: bookImage.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
    }

}
