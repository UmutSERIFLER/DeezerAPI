//
//  AlbumCellTest.swift
//  DeezerAPITests
//
//  Created by Umut SERIFLER on 08/12/2020.
//

import XCTest
@testable import DeezerAPI

class AlbumCellTest: XCTestCase {

    func test_cell_rendersCorrectData() throws {
        let cell = AlbumCollectionViewCell()
        let album = ResourceLoader.albums?.data.first
        cell.album = album
        XCTAssertNotNil(cell.album?.title)
        XCTAssertEqual(album?.title, cell.album?.title)
    }

}
