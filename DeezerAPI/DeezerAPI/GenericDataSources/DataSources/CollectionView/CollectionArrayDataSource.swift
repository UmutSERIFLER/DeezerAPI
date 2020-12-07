//
//  CollectionArrayDataSource.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

open class CollectionArrayDataSource<T, Cell: UICollectionViewCell>: CollectionDataSource<ArrayDataProvider<T>, Cell>
    where Cell: ConfigurableCell, Cell.T == T
{
    // MARK: - Lifecycle
    public convenience init(collectionView: UICollectionView, array: [T], cellConfig: [(Int,Int,UIView)]) {
        self.init(collectionView: collectionView, array: [array], cellConfig: cellConfig)
    }

    public init(collectionView: UICollectionView, array: [[T]], cellConfig: [(Int,Int,UIView)]) {
        let provider = ArrayDataProvider(array: array, cellConfig: cellConfig)
        super.init(collectionView: collectionView, provider: provider)
    }

    // MARK: - Public Methods
    public func item(at indexPath: IndexPath) -> T? {
        return provider.item(at: indexPath)
    }

    public func updateItem(at indexPath: IndexPath, value: T) {
        provider.updateItem(at: indexPath, value: value)
    }
}
