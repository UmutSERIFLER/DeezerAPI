//
//  AlbumTracksModel.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

struct AlbumTracksModel: Decodable {
    var data: [TrackModel]
    var total: Int
}
