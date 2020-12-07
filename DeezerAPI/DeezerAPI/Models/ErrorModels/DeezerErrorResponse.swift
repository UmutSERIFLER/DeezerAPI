//
//  DeezerErrorResponse.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

struct DeezerErrorResponse: Decodable, Error {
    var error : ErrorModel
    struct ErrorModel: Decodable {
        var type: String
        var message: String
        var code: Int
        
        init(type: String = "", message: String = "", code: Int = 0) {
            self.type = type
            self.message = message
            self.code = code
        }
    }
    
    init(error: ErrorModel = ErrorModel()) {
        self.error = error
    }
}
