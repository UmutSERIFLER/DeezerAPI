//
//  TrackTableViewCell.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

class TrackTableViewCell: UITableViewCell, ConfigurableCell {
    
    // MARK: - ConfigurableCell
    func configure(_ item: TrackModel, at indexPath: IndexPath) {
        self.artist = item
        self.trackOrder.text = "\(indexPath.row + 1)."
    }
    
    var artist: TrackModel? {
        didSet {
            self.trackName.text = artist?.title
            self.artistName.text = artist?.artist.name
            self.trackDuration.text = artist?.duration.getDurationAsString()
        }
    }
    
    fileprivate let trackOrder : UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let trackName : UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let artistName : UILabel = {
       let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let trackDuration : UILabel = {
       let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .black
    
        addSubview(trackOrder)
        trackOrder.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        trackOrder.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        trackOrder.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        trackOrder.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
        addSubview(trackDuration)
        trackDuration.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        trackDuration.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        trackDuration.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        trackDuration.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        addSubview(trackName)
        trackName.leadingAnchor.constraint(equalTo: trackOrder.trailingAnchor).isActive = true
        trackName.trailingAnchor.constraint(equalTo: trackDuration.leadingAnchor).isActive = true
        trackName.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        trackName.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true

        addSubview(artistName)
        artistName.topAnchor.constraint(equalTo: trackName.bottomAnchor).isActive = true
        artistName.widthAnchor.constraint(equalTo: trackName.widthAnchor).isActive = true
        artistName.centerXAnchor.constraint(equalTo: trackName.centerXAnchor).isActive = true
        artistName.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
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
