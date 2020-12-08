//
//  TrackViewModel.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

class TrackViewModel: ViewModelProtocol {
    
    var reloadTableViewClosure: (() -> ()) = {}
    var showAlertClosure: ((String?) -> ()) = {_ in }
    
    private(set) var apiService : DeezerAPIProvider!
    private(set) var tracks: AlbumTracksModel? {
        didSet {
            self.reloadTableViewClosure()
        }
    }
    
    private(set) var coverImageLink: String?
    private(set) var albumName: String?
    
    init(album: AlbumModel) {
        self.apiService = DeezerAPIProvider()
        albumName = album.title
        coverImageLink = album.cover_medium
        self.getAlbumTrack(id: album.id)
    }
    
    func getAlbumTrack(id: Int) {
        apiService.getAlbumTrack(id: id) { [weak self] (result) in
            switch result {
            case .success(let tracks):
                self?.tracks = tracks
            case .failure(let error):
                self?.showAlertClosure(error.localizedDescription)
            }
        }
    }
}
