//
//  CellConfigModel.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

struct CellConfigModel {
    var cellHeight: Int
    var sectionHeaderHeight: Int
    var sectionHeaderView: UIView
    
    init(cellHeight: Int = 50,sectionHeaderHeight: Int = 50, sectionHeaderView: UIView = UIView()) {
        self.cellHeight = cellHeight
        self.sectionHeaderHeight = sectionHeaderHeight
        self.sectionHeaderView = sectionHeaderView
    }
}
