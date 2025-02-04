//
//  FavoritesViewModelTests.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//


import XCTest
@testable import ChallengeEclipseWorks

class FavoritesViewModelTests: XCTestCase {
    var viewModel: FavoritesViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = FavoritesViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testAddFavorite() {
        let apodItem = APODItem(
            date: "2023-10-25",
            title: "Test Image",
            explanation: "This is a test image.",
            url: "https://apod.nasa.gov/apod/image/2310/ExampleImage.jpg",
            media_type: "image",
            copyright: "NASA"
        )
        
        viewModel.addFavorite(apodItem)
        
        XCTAssertTrue(viewModel.favorites.contains(apodItem))
    }
    
    func testRemoveFavorite() {
        let apodItem = APODItem(
            date: "2023-10-25",
            title: "Test Image",
            explanation: "This is a test image.",
            url: "https://apod.nasa.gov/apod/image/2310/ExampleImage.jpg",
            media_type: "image",
            copyright: "NASA"
        )
        
        viewModel.addFavorite(apodItem)
        viewModel.removeFavorite(apodItem)
        
        XCTAssertFalse(viewModel.favorites.contains(apodItem))
    }
}
