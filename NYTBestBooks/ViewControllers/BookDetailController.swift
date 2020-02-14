//
//  BookDetailController.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import DataPersistence

class BookDetailController: UIViewController {
    
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
        //view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupToolBar()
    }
    
    
    public func updateUI() {
        // TODO: Using the "Book" that's been persisted
        // set up the image for the book
        // set up the title of the book
        // set up the description
    }
    
    public func setupToolBar() {
        view.addSubview(toolBar)
        
        var items = [UIBarButtonItem]()
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        items.append(
            UIBarButtonItem(image: UIImage(named: "apple-icon"), style: .plain, target: nil, action: nil)
        )
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        items.append(
            UIBarButtonItem(image: UIImage(named: "barnes-and-noble"), style: .plain, target: nil, action: nil)
        )
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        items.append(
            UIBarButtonItem(image: UIImage(named: "amazon-a"), style: .plain, target: nil, action: nil)
        )
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        items.append(
            UIBarButtonItem(image: UIImage(named: "location-icon"), style: .plain, target: nil, action: nil))
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
            toolBar.heightAnchor.constraint(equalToConstant: 60)
        ])
        toolBar.setItems(items, animated: true)
    }
    
    
    
}

