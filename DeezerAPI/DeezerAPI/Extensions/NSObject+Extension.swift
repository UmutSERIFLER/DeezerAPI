//
//  NSObject+Extension.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

extension NSObject {
    
    // Name Of class
    class var identifier: String {
        return String(describing: self)
    }
}
