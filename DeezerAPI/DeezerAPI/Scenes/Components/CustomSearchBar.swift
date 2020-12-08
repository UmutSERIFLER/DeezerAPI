//
//  CustomSearchBar.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

class CustomSearchBar: UISearchBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(origin: .zero, size: CGSize(width: frame.width - 40, height: 20))
        self.setSearchBarColor()
        self.placeholder = "Search for an artist"
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
