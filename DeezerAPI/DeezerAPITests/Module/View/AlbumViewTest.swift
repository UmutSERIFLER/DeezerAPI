//
//  AlbumViewTest.swift
//  DeezerAPITests
//
//  Created by Umut SERIFLER on 08/12/2020.
//

import XCTest
@testable import DeezerAPI

class AlbumViewTest: XCTestCase {
    
    func test_artistCell() throws {
        let exp = expectation(description: "deinit")
        
        let artists = ResourceLoader.artists
        let viewModel = AlbumsViewModel(artists?.data.first)
        var sut: MockAlbumView? = MockAlbumView(viewModel: viewModel)
        
        sut?.deinitCalled = {
            exp.fulfill()
        }
        DispatchQueue.global(qos: .background).async {
            sut = nil
        }
        
        waitForExpectations(timeout: 4.0)
    }

}

private class MockAlbumView: AlbumsViewController {
    var deinitCalled: (() -> Void)?
    deinit { deinitCalled?() }
}
