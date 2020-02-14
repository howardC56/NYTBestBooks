//
//  NYTBestSellersController.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import DataPersistence

class NYTBestSellersController: UIViewController {
    
    private var dataPersistence: DataPersistence<Book>
    private let bestSellerView = NYTBestSellersView()
    private var  userPreference:  UserPreference
    private var menuShowing = false
    
    private var category = "Paperback-Nonfiction" {
        didSet {
            getBooks()
        }
    }
    
    private var books = [Book]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellerView.collectionView.reloadData()
            }
        }
    }
    
    private var categories = [Categories]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellerView.sideMenu.collectionView.reloadData()
            }
        }
    }
    
    
    init(dataPersistence: DataPersistence<Book>,  userPreference: UserPreference) {
        self.dataPersistence = dataPersistence
        self.userPreference = userPreference
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Top Books"
        view = bestSellerView
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(handleMenu(_:)))
        
        navigationItem.leftBarButtonItem?.tintColor = .black
        view.backgroundColor = .tertiarySystemBackground
        
        userPreference.delegate = self
        
        bestSellerView.sideMenu.collectionView.dataSource = self
        bestSellerView.sideMenu.collectionView.delegate = self
        
        bestSellerView.collectionView.dataSource = self
        bestSellerView.collectionView.delegate = self
        
        bestSellerView.collectionView.register(NYTBestSellerViewCell.self, forCellWithReuseIdentifier: "bestSellerCell")
        bestSellerView.sideMenu.collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "categoryCell")
        
        //getBooks()
        fetchCategories()
        getCategory()
    }
    
    @objc public func handleMenu(_ sender: UIBarButtonItem) {
        if menuShowing {
            UIView.animate(withDuration: 0.3) {
                self.bestSellerView.sideMenuWidth?.isActive = false
                self.bestSellerView.sideMenuWidth = self.bestSellerView.sideMenu.widthAnchor.constraint(equalToConstant: 0)
                self.bestSellerView.sideMenuWidth?.isActive = true
                self.bestSellerView.layoutIfNeeded()
            }
            
        } else {
            UIView.animate(withDuration: 0.3) {
                self.bestSellerView.sideMenuWidth?.isActive = false
                self.bestSellerView.sideMenuWidth = self.bestSellerView.sideMenu.widthAnchor.constraint(equalToConstant: 250)
                self.bestSellerView.sideMenuWidth?.isActive = true
                self.bestSellerView.layoutIfNeeded()
            }
            
        }
        menuShowing = !menuShowing
    }
    
    private func getCategory() {
        category = userPreference.getCategoryName() ?? "Animals"
        
        
    }
    
    private func fetchCategories() {
        CategoryAPIClient.fetchCategories() { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error fetching categories: \(appError)")
            case .success(let categories):
                self?.categories = categories
            }
        }
    }
    
    private func getBooks() {
        NYTAPIClient.getBooks(of: category) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error getting books: \(appError)")
            case .success(let books):
                self?.books = books
            }
        }
    }
}

extension NYTBestSellersController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var count = 1
        
        if collectionView == bestSellerView.sideMenu.collectionView {
            count = categories.count
        } else if collectionView == bestSellerView.collectionView {
            count = books.count
        }
        return count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == bestSellerView.collectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bestSellerCell", for: indexPath) as? NYTBestSellerViewCell else {
                fatalError("could not downcast to a bestSellerCell")
            }
            let book = books[indexPath.row]
            cell.configureCell(book: book)
            return cell
            
        } else if collectionView == bestSellerView.sideMenu.collectionView {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCell else {
                fatalError("could not downcast to CategoryCell")
            }
            
            let category = categories[indexPath.row]
            cell.configureCell(category: category)
            return cell
        }
        
        return UICollectionViewCell()
        
    }
}

extension NYTBestSellersController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize: CGSize = bestSellerView.safeAreaLayoutGuide.layoutFrame.size
        
        if collectionView == bestSellerView.collectionView {
            let itemWidth = maxSize.width
            let itemHeight = maxSize.height * 0.70
            return CGSize(width: itemWidth, height: itemHeight)
            
        } else if collectionView == bestSellerView.sideMenu.collectionView {
            let itemWidth = maxSize.width * 0.5
            let itemHeight = CGFloat(50)
            return CGSize(width: itemWidth, height: itemHeight)
            
        }
        return CGSize(width: 100, height: 100)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == bestSellerView.collectionView {
            // segue to detailVC
            
            let book = books[indexPath.row]
            let detailVC = BookDetailController(dataPersistence: dataPersistence, book: book)
            
            present(detailVC, animated: true)
            
            
            
        } else if collectionView == bestSellerView.sideMenu.collectionView {
            
            category = categories[indexPath.row].listName.replacingOccurrences(of: " ", with: "-")
        }
    }
}

extension NYTBestSellersController: UserPreferenceDelegate {
    func didChangeCategory(_ userPreference: UserPreference, category: String) {
        self.category = category
    }
    
    
}
