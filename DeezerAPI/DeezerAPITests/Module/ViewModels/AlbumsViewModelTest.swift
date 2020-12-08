//
//  AlbumsViewModelTest.swift
//  DeezerAPITests
//
//  Created by Umut SERIFLER on 08/12/2020.
//

import XCTest
@testable import DeezerAPI

class AlbumsViewModelTest: XCTestCase {

    private var albumsViewModel: AlbumsViewModel!
    private var apiService: MockAPIService!

    func testViewModelSuccessExample() throws {
        try self.testViewModel(forStatus: true)
    }
    
    func testViewModelFailExample() throws {
        try self.testViewModel(forStatus: false)
    }
    
    func testViewModel(forStatus: Bool = false) throws {
        let apiService = MockAPIService()
        let artist = ResourceLoader.artists?.data.first
        apiService.albumsModel = ResourceLoader.albums
        apiService.testForStatus = forStatus
        apiService.errorResponse = DeezerErrorResponse()
        apiService.getArtistAlbums(id: 0) { [weak self] result in
            self?.albumsViewModel = AlbumsViewModel(artist)
        }
        XCTAssertEqual(albumsViewModel.artistName, artist?.name)
    }

}
