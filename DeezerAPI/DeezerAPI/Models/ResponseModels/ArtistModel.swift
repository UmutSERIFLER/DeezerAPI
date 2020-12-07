//
//  ArtistModel.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

struct ArtistModel: Decodable {
    var id                  :   Int
    var name                :   String
    var link                :   String
    var picture             :   String
    var picture_small       :   String
    var picture_medium      :   String
    var picture_big         :   String
    var picture_xl          :   String
    var nb_album            :   Int
    var nb_fan              :   Int
    var radio               :   Bool
    var tracklist           :   String
    var type                :   String
    
    func artistImgeURL() -> URL? {
        if let url =  URL(string: picture) {
            return url
        }
        return nil
    }
}
