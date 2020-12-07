//
//  ArtistsModel.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

struct ArtistsModel: Decodable {
    var data : [ArtistModel]
    var total: Int
    var next: String?
}
