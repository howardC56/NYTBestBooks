//
//  NYTBestSellersController.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class NYTBestSellersController: UIViewController {
    
    private let bestSellerView = NYTBestSellersView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Top Books"
        view = bestSellerView
        view.backgroundColor = .tertiarySystemBackground
        bestSellerView.collectionView.dataSource = self
        bestSellerView.collectionView.delegate = self
        bestSellerView.collectionView.register(NYTBestSellerViewCell.self, forCellWithReuseIdentifier: "bestSellerCell")
        
    }
  

}

extension NYTBestSellersController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bestSellerCell", for: indexPath) as? NYTBestSellerViewCell else {
            fatalError("could not downcast to a bestSellerCell")
        }
        //cell.backgroundColor = .red
        return cell
    }
}

extension NYTBestSellersController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = bestSellerView.safeAreaLayoutGuide.layoutFrame.size
        
        let itemWidth = maxSize.width
        
        let itemHeight = maxSize.height * 0.70
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    
}
