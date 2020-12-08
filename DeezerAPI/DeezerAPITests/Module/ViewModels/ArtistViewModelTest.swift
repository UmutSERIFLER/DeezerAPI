//
//  ArtistViewModelTest.swift
//  DeezerAPITests
//
//  Created by Umut SERIFLER on 08/12/2020.
//

import XCTest
@testable import DeezerAPI

class ArtistViewModelTest: XCTestCase {

    private var artistsViewModel: ArtistsViewModel!
    private var apiService: MockAPIService!

    func testViewModelSuccessExample() throws {
        try self.testViewModel(forStatus: true)
    }
    
    func testViewModelFailExample() throws {
        try self.testViewModel(forStatus: false)
    }
    
    func testViewModel(forStatus: Bool = false) throws {
        let apiService = MockAPIService()
        let artists = ResourceLoader.artists
        apiService.testForStatus = forStatus
        apiService.artistsModel = artists
        apiService.errorResponse = DeezerErrorResponse()
        apiService.searchArtist(searchName: "") { [weak self] (result) in
            self?.artistsViewModel = ArtistsViewModel(artists)
        }
        XCTAssertEqual(artistsViewModel.artists?.data.first?.id, artists?.data.first?.id)
    }


}
