//
//  SettingsViewModelTests.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//


import XCTest
@testable import ChallengeEclipseWorks

class SettingsViewModelTests: XCTestCase {
    var viewModel: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = SettingsViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testThemeSelection() {
        viewModel.selectedTheme = .dark
        
        XCTAssertEqual(viewModel.colorScheme, .dark)
    }
    
    func testSystemTheme() {
        viewModel.selectedTheme = .system
        
        XCTAssertNil(viewModel.colorScheme)
    }
}
