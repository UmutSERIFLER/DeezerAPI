//
//  ArtistTableViewCell.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

class ArtistTableViewCell: UITableViewCell, ConfigurableCell {
    
    // MARK: - ConfigurableCell
    func configure(_ item: ArtistModel, at indexPath: IndexPath) {
        self.artist = item
    }
    
    var artist: ArtistModel? {
        didSet {
            self.artistName.text = artist?.name
            self.artistImage.loadImageAsync(with: artist?.picture)
        }
    }
    
    fileprivate let artistImage : UIImageView = {
        let imageView = UIImageView(frame: CGRect.init(origin: .zero, size: CGSize(width: 50, height: 50)))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let artistName : UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        self.artistImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(artistImage)
        self.artistImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.artistImage.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        self.artistImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.artistImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.artistName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(artistName)
        self.artistName.leftAnchor.constraint(equalTo: self.artistImage.rightAnchor).isActive = true
        self.artistName.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        self.artistName.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.artistName.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
