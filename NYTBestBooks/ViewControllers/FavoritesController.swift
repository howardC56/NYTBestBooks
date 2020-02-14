//
//  FavoritesController.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//
import DataPersistence
import UIKit

final class FavoritesController: UIViewController {
    
    private let favoriteView = FavoritesView()
    private var dataPersistence: DataPersistence<Book>!
    private var altCell: Bool = false
    
    private var favoriteBooks = [Book]() {
        didSet {
            favoriteView.collectionview.reloadData()
            if favoriteBooks.isEmpty {
                favoriteView.collectionview.backgroundView = EmptyFavoritesView()
                navigationItem.title = "Empty Gallery - Add Some Books"
                emitBooks()
            } else {
                favoriteView.collectionview.backgroundView = nil
                navigationItem.title = "Favorited Books"
            }
        }
    }
    
    private func emitBooks() {
        let emitter = Emitter.get(with: #imageLiteral(resourceName: "leatherBook"))
        emitter.emitterPosition = CGPoint(x: view.frame.width / 2, y: 5)
        emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
        view.layer.addSublayer(emitter)
    }
    
    init(dataPersistence: DataPersistence<Book>) {
        self.dataPersistence = dataPersistence
        super.init(nibName: nil, bundle: nil)
        self.dataPersistence.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        //        if favoriteBooks.isEmpty {
        //        view = EmptyFavoritesView()
        //        navigationItem.title = "Empty Gallery - Add Some Books"
        //        emitBooks()
        //        } else {
        view = favoriteView
        title = "Favorites"
        // }
    }
    
    //Remove after testing
    private func getBooks() {
        NYTAPIClient.getBooks(of: "hardcover-fiction") { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let appError):
                    print("error getting books: \(appError)")
                case .success(let books):
                    self?.favoriteBooks = books
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        //getFavoriteBooks()
        favoriteView.collectionview.delegate = self
        favoriteView.collectionview.dataSource = self
        favoriteView.collectionview.register(FavoritesViewCell.self, forCellWithReuseIdentifier: "FavoritesViewCell")
        favoriteView.collectionview.register(FavoritesAltCollectionViewCell.self, forCellWithReuseIdentifier: "FavoritesAltCollectionViewCell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "wand.and.stars"), style: .plain, target: self, action: #selector(changeStyles))
        getBooks()
    }
    
    @objc func changeStyles() {
        altCell.toggle()
        favoriteView.collectionview.reloadData()
    }
    
    private func getFavoriteBooks() {
        do {
            favoriteBooks = try dataPersistence.loadItems()
        } catch {
            print("cant fetch yo")
        }
    }
    
}

extension FavoritesController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favoriteBooks.count
        //return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let saved = favoriteBooks[indexPath.row]
        if altCell == true {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesViewCell", for: indexPath) as? FavoritesViewCell else { fatalError() }
            cell.backgroundColor = .systemBackground
            cell.configureCell(saved)
            cell.delegate = self
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesAltCollectionViewCell", for: indexPath) as? FavoritesAltCollectionViewCell else { fatalError() }
            cell.configCell(saved)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if altCell == true {
            return 20
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if altCell == false {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        } else {
            return CGSize(width: collectionView.frame.width / 1.2, height: collectionView.frame.height / 1.5)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if altCell == true {
            return UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if altCell == true {
            let selected = favoriteBooks[indexPath.row]
            let detailVC = BookDetailController()
            //detailVC.article = favoriteBooks[indexPath.row]
            //detailVC.dataPersistence = dataPersistence
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

extension FavoritesController: FavoritesViewCellDelegate {
    func didPressMoreOptionsButton(cell: FavoritesViewCell, book: Book) {
        let alertController = UIAlertController(title: "Choose", message: "Book's Destiny", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let delete = UIAlertAction(title: "Throw Out", style: .destructive) { [weak self] (alertAction) in
            self?.deleteBook(book)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(delete)
        if let popoverPresentationController = alertController.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverPresentationController.permittedArrowDirections = []
        }
        present(alertController,animated: true)
    }
    
    private func deleteBook(_ book: Book) {
        guard let index = favoriteBooks.firstIndex(of: book) else { return }
        do {
            try dataPersistence.deleteItem(at: index)
        } catch {
            print("error deleting article: \(error)")
        }
    }
}

extension FavoritesController: DataPersistenceDelegate {
    func didSaveItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        getFavoriteBooks()
    }
    
    func didDeleteItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        getFavoriteBooks()
    }
}

extension FavoritesController: FavoritesAltViewCellDelegate {
    func didPressBookButton(cell: FavoritesAltCollectionViewCell, book: Book) {
        guard let selected = favoriteBooks.firstIndex(of: book) else { return }
        let detailVC = BookDetailController()
        print("Book pressed")
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}
