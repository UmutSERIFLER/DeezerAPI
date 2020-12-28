//
//  TrackViewController.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

class TrackViewController: BaseViewController<UITableView> {
    
    private(set) var viewModel: TrackViewModel?
    private(set) var tracksDataSource: TracksDataSource?
    private(set) var coverImage = UIImageView()
    
    init(viewModel: TrackViewModel,_ tableView: UITableView = BaseTableView(cellArray: [TrackTableViewCell.self])) {
        self.viewModel = viewModel
        super.init()
        self.title = viewModel.albumName
        self.listview = tableView
        self.updateUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func updateUI(){
        coverImage.loadImageAsync(with: viewModel?.coverImageLink)
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        coverImage.contentMode = .scaleAspectFit
        view.addSubview(coverImage)
        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            coverImage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            coverImage.heightAnchor.constraint(equalToConstant: 300),
            coverImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            listview.topAnchor.constraint(equalTo: coverImage.bottomAnchor),
            listview.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            listview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            listview.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    override func initViewModel() {
        // Setup for reloadTableViewClosure
        viewModel?.reloadTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.tracksDataSource = self?.setUpDataSource()
            }
        }
    }
}

class TracksDataSource: TableArrayDataSource<TrackModel, TrackTableViewCell> {}

//// MARK: - Private Methods
fileprivate extension TrackViewController {
    func setUpDataSource() -> TracksDataSource? {
        
        guard let trackList = viewModel?.tracks?.data else {
            return nil
        }
        
        let cellConfig = [CellConfigModel(sectionHeaderView: TrackHeaderView(frame: CGRect.init(origin: .zero, size: CGSize(width: listview.frame.width, height: 50))))]
        let dataSource = TracksDataSource(tableView: listview, array: [trackList], cellConfig: cellConfig)
        return dataSource
    }
}
