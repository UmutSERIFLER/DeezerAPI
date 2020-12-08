//
//  AlbumModel.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

struct AlbumModel: Decodable {
    var id                  :   Int
    var title               :   String
    var link                :   String
    var cover               :   String
    var cover_small        :    String
    var cover_medium       :    String
    var cover_big          :    String
    var cover_xl            :   String
    var md5_image           :   String
    var genre_id            :   Int
    var fans                :   Int
    var release_date        :   String
    var record_type         :   String
    var tracklist           :  String
    var explicit_lyrics     :  Bool
    var type                :   String
    
}
