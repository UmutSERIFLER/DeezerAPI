//
//  AlbumsViewController.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

class AlbumsViewController: BaseViewController<UICollectionView> {
    
    internal var viewModel: AlbumsViewModel?
    fileprivate var albumDataSource: AlbumsDataSource?
    
    init(viewModel: AlbumsViewModel, collectionView: UICollectionView = BaseCollectionView(cellArray: [AlbumCollectionViewCell.self])) {
        self.viewModel = viewModel
        super.init()
        listview = collectionView
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initViewModel() {
        // Setup for reloadTableViewClosure
        viewModel?.reloadTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.albumDataSource = self?.setUpDataSource()
            }
        }
        viewModel?.showAlertClosure = { [weak self] errorMessage in
            guard let errorMessage = errorMessage else { return }
            self?.showAlert(withMessage: errorMessage)
        }
    }
}

class AlbumsDataSource: CollectionArrayDataSource<AlbumModel, AlbumCollectionViewCell> {}

//// MARK: - Private Methods
fileprivate extension AlbumsViewController {
    func setUpDataSource() -> AlbumsDataSource? {
        
        guard let albumList = viewModel?.albums?.data else {
            return nil
        }
        let dataSource = AlbumsDataSource(collectionView: self.listview, array: [albumList], cellConfig: [])
        dataSource.collectionItemSelectionHandler = { [weak self] indexPath in
            if let albumCell : AlbumCollectionViewCell = self?.listview.cellForItem(at: indexPath) as? AlbumCollectionViewCell, let album = albumCell.album {
                
                DispatchQueue.main.async { [weak self] in
                    let trackViewController = TrackViewController(viewModel: TrackViewModel(album: album))
                    trackViewController.title = album.title
                    self?.navigationController?.pushViewController(trackViewController, animated: true)
                }
            }
        }
        return dataSource
    }
}
