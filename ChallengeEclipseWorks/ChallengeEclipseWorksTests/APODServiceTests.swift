//
//  APODServiceTests.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//


import XCTest
@testable import ChallengeEclipseWorks

class APODServiceTests: XCTestCase {
    var apodService: APODService!
    
    override func setUp() {
        super.setUp()
        apodService = APODService.shared
    }
    
    override func tearDown() {
        apodService = nil
        super.tearDown()
    }
    
    func testFetchAPODSuccess() async {
        let date = Date()
        
        do {
            let apodItem = try await apodService.fetchAPOD(for: date)
            XCTAssertNotNil(apodItem)
            XCTAssertFalse(apodItem.title.isEmpty)
            XCTAssertFalse(apodItem.explanation.isEmpty)
            XCTAssertFalse(apodItem.url.isEmpty)
        } catch {
            XCTFail("Erro inesperado: \(error.localizedDescription)")
        }
    }
}
