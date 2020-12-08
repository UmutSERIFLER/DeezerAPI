//
//  GenericDataProvider.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

public protocol GenericDataProvider {
    associatedtype T
    func getHeaderView(in section: Int) -> UIView
    func getHeaderViewHeight(in section: Int) -> Int
    func numberOfSections() -> Int
    func getCellHeight(in section: Int) -> Int
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> T?
    func updateItem(at indexPath: IndexPath, value: T)
}

