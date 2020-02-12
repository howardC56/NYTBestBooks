//
//  FavoritesController.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class FavoritesController: UIViewController {
    
    private let favoriteView = FavoritesView()
    //public var dataPersistence: DataPersistence<Book>!
    
    private var favoriteBooks = [Book]() {
        didSet {
            favoriteView.collectionview.reloadData()
//             if favoriteBooks.isEmpty {
//                favoriteView.collectionview.backgroundView = EmptyFavoritesView()
//                       } else {
//                           favoriteView.collectionview.backgroundView = nil
//                       }
        }
    }
    
    func emitBooks() {
        let emitter = Emitter.get(with: #imageLiteral(resourceName: "leatherBook"))
        emitter.emitterPosition = CGPoint(x: view.frame.width / 2, y: 5)
        emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
        view.layer.addSublayer(emitter)
      }
    
    override func loadView() {
        if favoriteBooks.isEmpty {
        view = EmptyFavoritesView()
        navigationItem.title = "Empty Gallery - Add Some Books"
        emitBooks()
        } else {
        view = favoriteView
        title = "Favorites"
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        getFavoriteBooks()
        favoriteView.collectionview.delegate = self
        favoriteView.collectionview.dataSource = self
        favoriteView.collectionview.register(FavoritesViewCell.self, forCellWithReuseIdentifier: "FavoritesViewCell")
    }
    
    private func getFavoriteBooks() {
        do {
           //favoriteBooks = try dataPersistence.loadItems()
        } catch {
            print("cant fetch yo")
        }
    }
    
}

extension FavoritesController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //favoriteBooks.count
       return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesViewCell", for: indexPath) as? FavoritesViewCell else { fatalError() }
        cell.backgroundColor = .systemBackground
        //let saved = favoriteBooks[indexPath.row]
        //cell.configureCell(saved)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = BookDetailController()
        //detailVC.article = favoriteBooks[indexPath.row]
        //detailVC.dataPersistence = dataPersistence
        navigationController?.pushViewController(detailVC, animated: true)
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
            //try dataPersistence.deleteItem(at: index)
        } catch {
            print("error deleting article: \(error)")
        }
    }
}
