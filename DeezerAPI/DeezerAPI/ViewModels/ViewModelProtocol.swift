//
//  ViewModelProtocol.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import Foundation

protocol ViewModelProtocol {
    var reloadTableViewClosure: (()->()) { get }
    var showAlertClosure: ((String?)->()) { get }
}
