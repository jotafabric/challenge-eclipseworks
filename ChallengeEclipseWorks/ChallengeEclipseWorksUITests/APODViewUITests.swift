//
//  APODViewUITests.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//


import XCTest

class APODViewUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testAPODViewNavigation() {
        XCTAssertTrue(app.navigationBars["APOD NASA"].exists)
        
        XCTAssertTrue(app.datePickers["Selecione a data"].exists)
    }
    
    func testNavigateToFavorites() {
        app.buttons["Favoritos"].tap()
        
        XCTAssertTrue(app.navigationBars["Favoritos"].exists)
    }
    
    func testNavigateToSettings() {
        app.buttons["Configurações"].tap()
        
        XCTAssertTrue(app.navigationBars["Configurações"].exists)
    }
}
