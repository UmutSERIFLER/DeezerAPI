//
//  DeezerApi.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

public enum DeezerApi {
    case searchArtist(name:String)
    case artistAlbums(albumID:Int)
    case albumInfo(albumID:Int)
    case albumTracks(albumID:Int)
}

fileprivate enum DezeerServiceTitles: String {
    case search = "search/"
    case artist = "artist"
    case album = "album/"
}

extension DeezerApi: EndPointType {
    
    var baseURL: URL {
        guard let url = URL(string: KeyProvider.deezerAPIBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .searchArtist(let name):
            return DezeerServiceTitles.search.rawValue + DezeerServiceTitles.artist.rawValue + "?q=\(name)"
        case .artistAlbums(let albumID):
            return DezeerServiceTitles.artist.rawValue + "/\(albumID)/albums"
        case .albumInfo(let albumID):
            return DezeerServiceTitles.album.rawValue + "\(albumID)"
        case .albumTracks(let albumID):
            return DezeerServiceTitles.album.rawValue + "\(albumID)/tracks"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .albumInfo(_), .albumTracks(_), .searchArtist(_), .artistAlbums(_):
            return .get
        }
    }
    
    var task: HTTPTask {
        // Can be extended according to task type using switch case statement
        return .request
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
