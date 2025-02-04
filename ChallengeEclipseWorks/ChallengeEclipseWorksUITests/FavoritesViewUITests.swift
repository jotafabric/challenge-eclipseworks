//
//  FavoritesViewUITests.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//


import XCTest

class FavoritesViewUITests: XCTestCase {
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
    
    func testFavoritesViewEmptyState() {
        app.buttons["Favoritos"].tap()
        
        XCTAssertTrue(app.staticTexts["Nenhum favorito adicionado ainda."].exists)
    }
    
    func testAddAndRemoveFavorite() {
        app.buttons["Adicionar aos Favoritos"].tap()
        
        app.buttons["Favoritos"].tap()
        
        XCTAssertTrue(app.staticTexts["Test Image"].exists)

        app.buttons["Remover dos Favoritos"].tap()
        
        // Verifica se o item foi removido
        XCTAssertFalse(app.staticTexts["Test Image"].exists)
    }
}
