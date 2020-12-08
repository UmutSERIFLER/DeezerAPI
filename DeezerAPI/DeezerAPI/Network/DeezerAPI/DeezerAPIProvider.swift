//
//  DeezerAPIProvider.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

fileprivate enum DeezerErrorTypes {
    case noNetwork
    case invalidData
    case unknownError(message: String)
    
    func getError() -> DeezerErrorResponse {
        switch self {
        case .noNetwork:
            return DeezerErrorResponse(error: DeezerErrorResponse.ErrorModel(type: "Network", message: "Please check your connection..", code: 0))
        case .invalidData:
            return DeezerErrorResponse(error: DeezerErrorResponse.ErrorModel(type: "Data", message: "Invalid data has taken", code: 0))
        case .unknownError(let message):
            return DeezerErrorResponse(error: DeezerErrorResponse.ErrorModel(type: "Unknown", message: message, code: 0))
        }
    }
}

protocol DeezerAPIProviderProtocol {
    func genericParser<M>(_ data: Data?, _ response: URLResponse?, _ error: Error?, completionHandler: @escaping (Result<M, DeezerErrorResponse>) -> ()) where M : Decodable
    func searchArtist(searchName: String, completionHandler: @escaping (Result<ArtistsModel, DeezerErrorResponse>) -> ())
    func getArtistAlbums(id albumID: Int, completionHandler: @escaping (Result<AlbumsModel, DeezerErrorResponse>) -> ())
    func getAlbumInfo(id albumInfoId: Int, completionHandler: @escaping (Result<AlbumInfoModel, DeezerErrorResponse>) -> ())
    func getAlbumTrack(id albumTrackId: Int, completionHandler: @escaping (Result<AlbumTracksModel, DeezerErrorResponse>) -> ())
}

struct DeezerAPIProvider: DeezerAPIProviderProtocol {
    
    let router = Router<DeezerApi>()
    
    func genericParser<M>(_ data: Data?, _ response: URLResponse?, _ error: Error?, completionHandler: @escaping (Result<M, DeezerErrorResponse>) -> ()) where M : Decodable {
        if error != nil {
            completionHandler(.failure(DeezerErrorTypes.noNetwork.getError()))
        }
        if let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode {
            guard let responseData = data else {
                completionHandler(.failure(DeezerErrorTypes.invalidData.getError())) // Data is nil
                return
            }
            do {
                let decodedModel = try JSONDecoder().decode(M.self, from: responseData)
                completionHandler(.success(decodedModel))
            } catch  {
                do {
                    let error = try JSONDecoder().decode(DeezerErrorResponse.self, from: responseData)
                    completionHandler(.failure(error))
                } catch {
                    completionHandler(.failure(DeezerErrorTypes.invalidData.getError()))
                }
            }
        } else {
            completionHandler(.failure(DeezerErrorTypes.unknownError(message: error?.localizedDescription ?? "").getError()))
        }
    }
    
    func searchArtist(searchName: String, completionHandler: @escaping (Result<ArtistsModel, DeezerErrorResponse>) -> ()) {
        router.request(.searchArtist(name: searchName)) { data,response,error  in
            self.genericParser(data, response, error) { (result) in
                completionHandler(result)
            }
        }
    }
    
    func getArtistAlbums(id albumID: Int, completionHandler: @escaping (Result<AlbumsModel, DeezerErrorResponse>) -> ()) {
        router.request(.artistAlbums(albumID: albumID)) { data,response,error  in
            self.genericParser(data, response, error) { (result) in
                completionHandler(result)
            }
        }
    }
    
    func getAlbumInfo(id albumInfoId: Int, completionHandler: @escaping (Result<AlbumInfoModel, DeezerErrorResponse>) -> ()) {
        router.request(.albumInfo(albumID: albumInfoId)) { (data, response, error) in
            self.genericParser(data, response, error) { (result) in
                completionHandler(result)
            }
        }
    }
    
    func getAlbumTrack(id albumTrackId: Int, completionHandler: @escaping (Result<AlbumTracksModel, DeezerErrorResponse>) -> ()) {
        router.request(.albumTracks(albumID: albumTrackId)) { (data, response, error) in
            self.genericParser(data, response, error) { (result) in
                completionHandler(result)
            }
        }
        
    }
    
}
