//
//  BookDetailController.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import DataPersistence
import ImageKit
import SafariServices

// TODO: Ensure it doesn't save duplicates
//TODO: toggle the function saved = filled star, unsave = unfilled star
class BookDetailController: UIViewController {
    
    private var detailView = BookDetailView()
    
    private var book: Book
    private var dataPersistence: DataPersistence<Book>
    let toolBar = UIToolbar()
    
    
    
    init(dataPersistence: DataPersistence<Book>, book: Book) {
        self.dataPersistence = dataPersistence
        self.book = book
        super.init(nibName: nil, bundle: nil)
        // self.dataPersistence.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //let detailView = DetailView()
    // need to add the data persistence
    // public var dataPersistence: DataPersistence<Book>!
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupToolBar()
        updateUI()
        detailView.favoriteButton.addTarget(self, action: #selector(saveBookButtonPressed(_:)), for: .touchUpInside)
        
        updateFavoriteStar(book)
        
    }
    
    
    public func updateUI() {
        
        
        detailView.bookImage.getImage(with: book.bookImage) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let appError):
                    print("failure: \(appError)")
                    self?.detailView.bookImage.image = UIImage(named: "book")
                case .success(let image):
                    self!.detailView.bookImage.image = image
                }
            }
        }
        detailView.titleLabel.text = book.title.capitalized
        detailView.authorLabel.text = "by \(book.author) "
        detailView.descriptionLabel2.text = book.description
        detailView.rankLabel.text = " Ranked: # \(book.rank) "
        if
            dataPersistence.hasItemBeenSaved(book) {
            
        } else {
             detailView.favoritesLabel.text = "Add to Favorites"
        }
        
        
        if book.weeksOnList <= 1 {
            detailView.weeksOnListLabel.text = "New this week!".uppercased()
        } else {
        detailView.weeksOnListLabel.text = "\(book.weeksOnList) weeks on the list ".uppercased()
        }
        
        
        
    }
    
    
    //
    public func setupToolBar() {
        view.addSubview(toolBar)
        
        var items = [UIBarButtonItem]()
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        items.append(
            UIBarButtonItem(image: UIImage(named: "apple-icon"), style: .plain, target: nil, action: #selector(appleSearch(_:)))
        )
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        items.append(
            UIBarButtonItem(image: UIImage(named: "barnes-and-noble"), style: .plain, target: nil, action: #selector(barnesAndNobleSearch(_:)))
        )
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: #selector(amazonSearch(_:))))
        items.append(
            UIBarButtonItem(image: UIImage(named: "amazon-a"), style: .plain, target: nil, action: #selector(amazonSearch(_:)))
        )
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        items.append(
            UIBarButtonItem(image: UIImage(named: "location-icon"), style: .plain, target: nil, action: #selector(localSearch(_:))))
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        view.addSubview(toolBar)
        let guide = view.safeAreaLayoutGuide
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toolBar.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            toolBar.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            toolBar.heightAnchor.constraint(equalToConstant: 70)
        ])
        toolBar.setItems(items, animated: true)
        

    }
    
    @objc func saveBookButtonPressed(_ sender: UIBarButtonItem) {
        
        
        if dataPersistence.hasItemBeenSaved(book) {
            
            
            
            detailView.favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
            
            if let index = try? dataPersistence.loadItems().firstIndex(of: book) {
                do {
                    try dataPersistence.deleteItem(at: index)
                    detailView.favoritesLabel.text = "Add to Favorites"
                } catch {
                    print("error deleting book: \(error)")
                }
            }
        } else {
            do {
                detailView.favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
                try dataPersistence.createItem(book)
                detailView.favoritesLabel.text = "Remove from Favorites"
                
            } catch {
                print("error saving book: \(error)")
            }
        }
        
        
    }
    
    private func updateFavoriteStar(_ book: Book) {
        if dataPersistence.hasItemBeenSaved(book) {
            detailView.favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            detailView.favoritesLabel.text = "Remove from Favorites"
            
}
        else {
            
            detailView.favoritesLabel.text = "Add to Favorites"
            detailView.favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    @objc private func amazonSearch(_ sender: UIBarButtonItem) {
        
        if let urlString = URL(string: book.bookLinks[0].url) {
            let safariVC = SFSafariViewController(url: urlString)
            present(safariVC, animated: true, completion: nil)
        }
    }
    
    @objc private func appleSearch(_ sender: UIBarButtonItem) {
        
        if let urlString = URL(string: book.bookLinks[1].url) {
            let safariVC = SFSafariViewController(url: urlString)
            present(safariVC, animated: true, completion: nil)
        }
    }
    
    @objc private func barnesAndNobleSearch(_ sender: UIBarButtonItem) {
        if let urlString = URL(string: book.bookLinks[2].url) {
            let safariVC = SFSafariViewController(url: urlString)
            present(safariVC, animated: true, completion: nil)
        }
        
    }
    
    @objc private func localSearch(_ sender: UIBarButtonItem) {
        
        if let urlString = URL(string: book.bookLinks[3].url) {
            let safariVC = SFSafariViewController(url: urlString)
            present(safariVC, animated: true, completion: nil)

        }
    }
    
    
    
    
    
}


