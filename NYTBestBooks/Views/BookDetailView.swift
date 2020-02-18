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
    
    public lazy var favoritesLabel: UILabel = {
             let label = UILabel()
             label.text = "Title"
             label.numberOfLines = 3
             label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
                     return label
         } ()

    public lazy var bookImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    public lazy var outerView: UIView = {
          let outerView = UIView()
          outerView.backgroundColor = .white
          outerView.layer.masksToBounds = false
          outerView.clipsToBounds = false
          outerView.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) //UIColor.black.cgColor
          outerView.layer.shadowOpacity = 0.8
          outerView.layer.shadowOffset = CGSize.zero
          outerView.layer.shadowRadius = 15
          
       
          return outerView
      }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
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
              
              label.text = "Rank"
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
                   
              
              return label
          }()
    
    public lazy var weeksOnListLabel: UILabel = {
              let label = UILabel()
              label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
              label.text = "Weeks on list"
              
              return label
          }()
    
    public lazy var descriptionLabel1: UILabel = {
       let label = UILabel()
        label.text = "Description"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        
        return label
    }()
    
    public lazy var descriptionLabel2: UILabel = {
        let label = UILabel()
            label.numberOfLines = 6
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
            label.text = ""
            
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
        setupFavoritesLabel()
        setupOutterView()
        setupImageView()
        setupTitleLabel()
        
        setupAuthorLabel()
        
        setupWeeksOnListLabel()
        setupRankLabel()
        setupDescriptionLabel1()
        setupDescriptionLabel2()
        backgroundColor = .white
    }
    
    
    private func setupFavoriteButton() {
        addSubview(favoriteButton)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            favoriteButton.heightAnchor.constraint(equalToConstant: 20),
            favoriteButton.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    private func setupFavoritesLabel() {
        addSubview(favoritesLabel)
        favoritesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoritesLabel.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -10),
            favoritesLabel.bottomAnchor.constraint(equalTo: favoriteButton.bottomAnchor)
        ])
    }
   
    private func setupOutterView() {
        addSubview(outerView)
        outerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                 outerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
                      outerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                      outerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.40),
                      outerView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.50)
        ])
    }
    
    private func setupImageView() {
           addSubview(bookImage)
           bookImage.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
               bookImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
               bookImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.40),
               bookImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.50)
           ])
       }
       
    private func setupTitleLabel() {
           
           addSubview(titleLabel)
           titleLabel.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: bookImage.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
           
       }
   
   
    
    private func setupAuthorLabel() {
        addSubview(authorLabel)
       authorLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 10),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        
    }
  
    
    private func setupWeeksOnListLabel() {
        addSubview(weeksOnListLabel)
        weeksOnListLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weeksOnListLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            weeksOnListLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 10),
            weeksOnListLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func setupRankLabel() {
        addSubview(rankLabel)
        rankLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rankLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 10),
          rankLabel.bottomAnchor.constraint(equalTo: bookImage.bottomAnchor),
          rankLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
    }
    
    private func setupDescriptionLabel1() {
        addSubview(descriptionLabel1)
        descriptionLabel1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel1.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 20),
            descriptionLabel1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel1.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func setupDescriptionLabel2() {
        addSubview(descriptionLabel2)
        descriptionLabel2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel2.topAnchor.constraint(equalTo: descriptionLabel1.bottomAnchor, constant: 10),
            descriptionLabel2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel2.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    

    
}
