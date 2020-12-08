//
//  ResourceLoader.swift
//  DeezerAPITests
//
//  Created by Umut SERIFLER on 08/12/2020.
//

import Foundation
@testable import DeezerAPI

struct ResourceLoader {
    static let artists: ArtistsModel? = readFile(named: "artists")
    static let albums: AlbumsModel? = readFile(named: "albums")
    static let tracks: AlbumTracksModel? = readFile(named: "tracks")
    
    static func readFile<ModelType: Decodable>(named name: String) -> ModelType?  {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else {
            return nil
        }
        
        return try? JSONDecoder().decode(ModelType.self, from: Data(contentsOf: url))

    }
}
