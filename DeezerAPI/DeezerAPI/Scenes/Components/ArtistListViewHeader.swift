//
//  ArtistListViewHeader.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

class ArtistListViewHeader: UIView {
    
    lazy var headerIcon : UIImageView = {
        let icon = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
        icon.image = UIImage(named: "microphone_icon")
        icon.contentMode = .scaleAspectFit
      
        return icon
    }()
    
    lazy var headerTitle: UILabel = {
        let headerTitle = UILabel()
        headerTitle.font = UIFont.systemFont(ofSize: 22, weight: .light)
        headerTitle.text = "Artists"
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

        let ImageContainerView = UIView()
        addSubview(ImageContainerView)
        ImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        ImageContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:10).isActive = true
        ImageContainerView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        ImageContainerView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        ImageContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        ImageContainerView.addSubview(headerIcon)
        
        addSubview(headerTitle)
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.leadingAnchor.constraint(equalTo: headerIcon.trailingAnchor, constant:10).isActive = true
        headerTitle.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        headerTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        headerTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
