//
//  ArtistsViewModel.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

class ArtistsViewModel: ViewModelProtocol {
    
    var reloadTableViewClosure: (() -> ()) = {}
    var showAlertClosure: ((String?) -> ()) = {_ in }
    
    private(set) var apiService : DeezerAPIProvider!
    private(set) var artists: ArtistsModel? {
        didSet {
            self.reloadTableViewClosure()
        }
    }
    
    init(_ artists: ArtistsModel? = nil,_ apiService: DeezerAPIProvider = DeezerAPIProvider()) {
        self.artists = artists
        self.apiService = apiService
        self.searchArtists(name: "")
    }
    
    func searchArtists(name: String?) {
        guard let validArtistName = name, !validArtistName.isEmpty else {
            return
        }
        apiService.searchArtist(searchName: validArtistName) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.artists = response
            case .failure(let error):
                self?.showAlertClosure(error.localizedDescription)
            }
        }
    }
     
}
