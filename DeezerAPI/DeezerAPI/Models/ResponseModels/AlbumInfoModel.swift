//
//  AlbumInfoModel.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

struct AlbumInfoModel: Decodable {
    var id                  :   Int
    var title               :   String
    var upc                 :   String
    var link                :   String
    var share               :  String
    var cover               :   String
    var cover_small        :    String
    var cover_medium       :    String
    var cover_big          :    String
    var cover_xl            :   String
    var md5_image           :   String
    var genre_id            :   Int
    var genres             :   GenreModel
    var label               :   String
    var nb_tracks           :   Int
    var duration           :    Int
    var fans                :   Int
    var rating              :   Int
    var release_date        :   String
    var record_type         :   String
    var available           :   Bool
    var tracklist           :  String
    var explicit_lyrics     :  Bool
    var explicit_content_lyrics :   String
    var explicit_content_cover  :   String
    var contributors            :   [Contributor]
    var artist          :   Artist          // ArtistModel can also be used here but we need to mark some fields are optional
    var type: String
    
    struct GenreModel:Decodable {
        var data:   GenreDataModel
        struct GenreDataModel: Decodable {
            var id: Int
            var name: String
            var picture: String
            var type:   String
        }
    }
    
    struct Contributor: Decodable {
        var id  : Int
        var name: String
        var link: String
        var share: String
        var picture: String
        var picture_small: String
        var picture_medium: String
        var picture_big: String
        var picture_xl: String
        var radio: Bool
        var tracklist: String
        var type: String
        var role: String
    }
    
    struct Artist: Decodable {
        var id                  :  Int
        var name                :  String
        var picture             :  String
        var picture_small      :  String
        var picture_medium     :  String
        var picture_big        :  String
        var picture_xl         :  String
        var tracklist          :  String
        var type               :   String
    }
    
}
