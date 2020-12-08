//
//  ConfigurableCell.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

public protocol ConfigurableCell: ReusableCell {
    associatedtype T
    func configure(_ item: T, at indexPath: IndexPath)
}
