//
//  ArtistsViewController.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

class ArtistsViewController: BaseViewController<UITableView>, UISearchBarDelegate {
    
    lazy var searchBar : UISearchBar = CustomSearchBar(frame: self.view.frame)
    
    private(set) var artistDataSource: ArtistListDataSource?
    private(set) var viewModel: ArtistsViewModel
    
    init(viewModel: ArtistsViewModel = ArtistsViewModel(), tableView: UITableView = BaseTableView(cellArray: [ArtistTableViewCell.self])) {
        self.viewModel = viewModel
        super.init()
        listview = tableView
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar)
    }
    
    // Initiliase View Model Actions
    override func initViewModel() {
        viewModel.reloadTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.artistDataSource = self?.setUpDataSource()
            }
        }
        viewModel.showAlertClosure = { [weak self] errorMessage in
            guard let errorMessage = errorMessage else { return }
            self?.showAlert(withMessage: errorMessage)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty || searchText.trimmingCharacters(in: .whitespaces).count == 0 {
            self.searchBar.resignFirstResponder()
            return
        }
        viewModel.searchArtists(name: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
    
}

// MARK: - Data Source
class ArtistListDataSource: TableArrayDataSource<ArtistModel, ArtistTableViewCell> {}

//// MARK: - Private Methods
fileprivate extension ArtistsViewController {
    func setUpDataSource() -> ArtistListDataSource? {
        guard let artistList = viewModel.artists?.data else {
            return nil
        }
        
        let cellConfig = [CellConfigModel(sectionHeaderView: ArtistListViewHeader(frame: CGRect.init(origin: .zero, size: CGSize(width: listview.frame.width, height: 50))))]
        let dataSource = ArtistListDataSource(tableView: listview, array: [artistList], cellConfig: cellConfig)
        dataSource.tableItemSelectionHandler = { [weak self] indexPath in
            if let selectedCell: ArtistTableViewCell = self?.listview.cellForRow(at: indexPath) as? ArtistTableViewCell, let artist = selectedCell.artist {
                self?.searchBar.resignFirstResponder()
                DispatchQueue.main.async {
                    self?.navigationController?.pushViewController(AlbumsViewController(viewModel: AlbumsViewModel(artist)), animated: true)
                }
            }
        }
        return dataSource
    }
}
