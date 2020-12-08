//
//  TrackHeaderView.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

class TrackHeaderView: UIView {
    
    lazy var headerTitle: UILabel = {
        let headerTitle = UILabel()
        headerTitle.font = UIFont(name: "Arial", size: 16)
        headerTitle.text = "Volume 1"
        headerTitle.textColor = .white
        headerTitle.textAlignment = .left
        return headerTitle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    //common func to init our view
    private func setupView() {
        backgroundColor = .black
        addSubview(headerTitle)
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:20).isActive = true
        headerTitle.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        headerTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        headerTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
