//
//  TrackModel.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

struct TrackModel: Decodable {
    var id           : Int
    var readable    : Bool
    var title       : String
    var title_short : String
    var title_version   : String
    var isrc        :       String
    var link        :   String
    var duration    :   Int
    var track_position  :   Int
    var disk_number     :   Int
    var rank        :   Int
    var explicit_lyrics :   Bool
    var explicit_content_lyrics :    Int
    var explicit_content_cover  : Int
    var preview     :   String
    var md5_image       :   String
    var artist:     ArtistTrackModel
    var type        :   String
    
    struct ArtistTrackModel: Decodable {
        var id  : Int
        var name    :   String
        var tracklist   :   String
        var type    :   String
    }
}
