//
//  AlbumsViewModel.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

class AlbumsViewModel: ViewModelProtocol {

    var reloadTableViewClosure: (() -> ()) = {}
    var showAlertClosure: ((String?) -> ()) = {_ in }
    
    private(set) var apiService : DeezerAPIProvider!
    private(set) var albums: AlbumsModel? {
        didSet {
            self.reloadTableViewClosure()
        }
    }
    
    private(set) var artistName: String?
    
    init(_ artist: ArtistModel? = nil,_ apiService: DeezerAPIProvider = DeezerAPIProvider()) {
        self.apiService = apiService
        self.artistName = artist?.name
        self.getArtistAlbums(id: artist?.id ?? 0)
    }
    
    func getArtistAlbums(id: Int) {
        apiService.getArtistAlbums(id: id) { [weak self] (result) in
            switch result {
            case .success(let albums):
                self?.albums = albums
            case .failure(let error):
                self?.showAlertClosure(error.localizedDescription)
            }
        }
    }
}
