//
//  AlbumCollectionViewCell.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell, ConfigurableCell {
    
    func configure(_ item: AlbumModel, at indexPath: IndexPath) {
        self.album = item
    }
    
    // Update Model
    var album: AlbumModel? {
        didSet {
            self.albumTitle.text = album?.title
            self.albumSubTitle.text = album?.release_date
            self.albumIV.loadImageAsync(with: album?.cover_medium)
        }
    }
    
    fileprivate lazy var albumIV : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    fileprivate lazy var albumTitle : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var albumSubTitle : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 8)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(albumIV)
        albumIV.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        albumIV.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        albumIV.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7).isActive = true
        albumIV.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        contentView.addSubview(albumTitle)
        albumTitle.topAnchor.constraint(equalTo: albumIV.bottomAnchor).isActive = true
        albumTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        albumTitle.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        albumTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        
        contentView.addSubview(albumSubTitle)
        albumSubTitle.topAnchor.constraint(equalTo: albumTitle.bottomAnchor).isActive = true
        albumSubTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        albumSubTitle.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
        albumSubTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
