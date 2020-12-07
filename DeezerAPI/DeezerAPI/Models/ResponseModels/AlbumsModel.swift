//
//  AlbumsModel.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

struct AlbumsModel: Decodable {
    var data : [AlbumModel]
    var total: Int
    var next: String?
}
