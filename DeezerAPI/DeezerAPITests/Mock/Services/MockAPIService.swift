//
//  MockAPIService.swift
//  DeezerAPITests
//
//  Created by Umut SERIFLER on 08/12/2020.
//

import Foundation
@testable import DeezerAPI

final class MockAPIService: DeezerAPIProviderProtocol {
    
    var testForStatus = false
    var errorResponse: DeezerErrorResponse!
    var artistsModel: ArtistsModel!
    var albumsModel: AlbumsModel!
    var trackModel: AlbumTracksModel!
    
    func genericParser<M>(_ data: Data?, _ response: URLResponse?, _ error: Error?, completionHandler: @escaping (Result<M, DeezerErrorResponse>) -> ()) where M : Decodable {
        
    }
    
    func searchArtist(searchName: String, completionHandler: @escaping (Result<ArtistsModel, DeezerErrorResponse>) -> ()) {
        if testForStatus {
            completionHandler(.success(artistsModel))
        } else {
            completionHandler(.failure(errorResponse))
        }
    }
    
    func getArtistAlbums(id albumID: Int, completionHandler: @escaping (Result<AlbumsModel, DeezerErrorResponse>) -> ()) {
        if testForStatus {
            completionHandler(.success(albumsModel))
        } else {
            completionHandler(.failure(errorResponse))
        }
    }
    
    func getAlbumInfo(id albumInfoId: Int, completionHandler: @escaping (Result<AlbumInfoModel, DeezerErrorResponse>) -> ()) {
        
    }
    
    func getAlbumTrack(id albumTrackId: Int, completionHandler: @escaping (Result<AlbumTracksModel, DeezerErrorResponse>) -> ()) {
        if testForStatus {
            completionHandler(.success(trackModel))
        } else {
            completionHandler(.failure(errorResponse))
        }
    }
    
    
}
