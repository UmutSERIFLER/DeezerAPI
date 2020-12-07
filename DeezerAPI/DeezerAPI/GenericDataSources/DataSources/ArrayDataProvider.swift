//
//  ArrayDataProvider.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

public class ArrayDataProvider<T>: GenericDataProvider {
    
    // MARK: - Internal Properties
    var items: [[T]] = []
    var configurations = [(cellHeight: 0, sectionHeight: 0, sectionHeaderView: UIView())]
    // MARK: - Lifecycle
    init(array: [[T]], cellConfig: [(Int,Int,UIView)]) {
        items = array
        self.configurations = cellConfig
    }
    
    // MARK: - CollectionDataProvider
    public func numberOfSections() -> Int {
        return items.count
    }
    
    public func numberOfItems(in section: Int) -> Int {
        guard section >= 0 && section < items.count else {
            return 0
        }
        return items[section].count
    }
    
    public func item(at indexPath: IndexPath) -> T? {
        guard indexPath.section >= 0 && indexPath.section < items.count &&
                indexPath.row >= 0 && indexPath.row < items[indexPath.section].count else {
            return nil
        }
        return items[indexPath.section][indexPath.row]
    }
    
    public func updateItem(at indexPath: IndexPath, value: T) {
        guard indexPath.section >= 0 && indexPath.section < items.count &&
                indexPath.row >= 0 && indexPath.row < items[indexPath.section].count else {
            return
        }
        items[indexPath.section][indexPath.row] = value
    }
    
    public func getCellHeight(in section: Int) -> Int {
        return self.configurations[section].cellHeight
    }
    
    public func getHeaderView(in section: Int) -> UIView {
        return self.configurations[section].sectionHeaderView
    }
    
    public func getHeaderViewHeight(in section: Int) -> Int {
        return self.configurations[section].sectionHeight
    }
}
