//
//  BaseViewController.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

class BaseViewController<T: UIView>: UIViewController {
    
    var listview: T!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tableView = listview as? UITableView {
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.frame = view.frame
        } else if let collectionView = listview as? UICollectionView {
            view.addSubview(collectionView)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.frame = view.frame
        }
        initViewModel()
        // Do any additional setup after loading the view.
    }
    
    // Initialize ViewModel with closures
    func initViewModel() {
        
    }
    
    
}
