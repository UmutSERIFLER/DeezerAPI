//
//  TableArrayDataSource.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

open class TableArrayDataSource<T, Cell: UITableViewCell>: TableDataSource<ArrayDataProvider<T>, Cell>
where Cell: ConfigurableCell, Cell.T == T
{
    // MARK: - Lifecycle
    public convenience init(tableView: UITableView, array: [T], cellConfig: [(Int,Int,UIView)]) {
        self.init(tableView: tableView, array: [array], cellConfig: cellConfig)
    }
    
    public init(tableView: UITableView, array: [[T]], cellConfig: [(Int,Int,UIView)]) {
        let arrayProvider = ArrayDataProvider(array: array, cellConfig: cellConfig)
        super.init(tableView: tableView, provider: arrayProvider)
    }
    
    // MARK: - Public Methods
    public func item(at indexPath: IndexPath) -> T? {
        return provider.item(at: indexPath)
    }
    
    public func updateItem(at indexPath: IndexPath, value: T) {
        provider.updateItem(at: indexPath, value: value)
    }
}
