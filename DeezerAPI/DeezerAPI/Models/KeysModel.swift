//
//  KeysModel.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

struct KeysModel : Decodable {
    
    let Keys : Keys
    struct Keys : Decodable {
        var DeezerAPIURL   : String
    }
    
}
