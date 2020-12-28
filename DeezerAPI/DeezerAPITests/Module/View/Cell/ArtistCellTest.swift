//
//  ArtistCellTest.swift
//  DeezerAPITests
//
//  Created by Umut SERIFLER on 08/12/2020.
//

import XCTest
@testable import DeezerAPI

class ArtistCellTest: XCTestCase {

    func test_cell_rendersCorrectData() throws {
        let cell = ArtistTableViewCell()
        let artist = ResourceLoader.artists?.data.first
        cell.artist = artist
        XCTAssertEqual(artist?.name, cell.artist?.name)
        XCTAssertNotNil(cell.artist?.name)
    }

}
