//
//  KeyProvider.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

class KeyProvider {
    
    static private(set) var deezerAPIBaseURL : String = ""
    
    static func readValues() {
        if let url = Bundle.main.url(forResource: "Keys", withExtension: "json") {
            do {
                let keysData = try JSONDecoder().decode(KeysModel.self, from: Data(contentsOf: url))
                deezerAPIBaseURL = keysData.Keys.DeezerAPIURL
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
