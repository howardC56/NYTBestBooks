//
//  NYTTabController.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import DataPersistence

class NYTTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [firstVC,secondVC,thirdVC]
    }

    private let dataPersistence = DataPersistence<Book>(filename: "favoriteBooks.plist")
    
    private lazy var firstVC: UINavigationController = {
    let navController = UINavigationController(rootViewController: NYTBestSellersController(dataPersistence: dataPersistence))
   navController.tabBarItem = UITabBarItem(title: "NYT Best Sellers",
                                            image: UIImage(systemName: "book"), selectedImage: UIImage(systemName: "book.fill"))
   return navController
 }()
    
    private lazy var secondVC: UINavigationController = {
        let navController = UINavigationController(rootViewController: FavoritesController(dataPersistence: dataPersistence))
      navController.tabBarItem = UITabBarItem(title: "Favorites",
                                               image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
      return navController
    }()
    
    private lazy var thirdVC: UIViewController = {
       let viewController = SettingsController()
      viewController.tabBarItem = UITabBarItem(title: "Settings",
                                               image: UIImage(systemName: "gear"), selectedImage: UIImage(systemName: "gear"))
      return viewController
    }()

}
