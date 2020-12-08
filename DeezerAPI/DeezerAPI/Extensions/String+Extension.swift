//
//  String+Extension.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 08/12/2020.
//

import Foundation

extension Int {
    
    func getDurationAsString() -> String {
        let minute = self / 60
        let second = self % 60
        let minuteString = minute < 10 ? "0\(minute)" : "\(minute)"
        let secondString = second < 10 ? "0\(second)" : "\(second)"
        return "\(minuteString):\(secondString)"
    }
    
}
