//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Sarah Lichter on 11/26/21.
//

import XCTest

class Tests_iOS: XCTestCase {

    func testPromptIsDisplayed() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertEqual(app.staticTexts["category"].label, "Self-Discovery")
        XCTAssertEqual(app.staticTexts["prompt"].label, "What are you looking to gain from building a journaling habit?")
        
        XCTAssert(app.staticTexts["Num of Times Used"].exists)
        XCTAssertEqual(app.staticTexts["count"].label, "0")
        
        XCTAssert(app.staticTexts["Last Used"].exists)
        XCTAssertEqual(app.staticTexts["lastUsed"].label, "-")
        
        app.images["Selected"].tap()
        XCTAssertEqual(app.staticTexts["count"].label, "1")
        XCTAssertNotEqual(app.staticTexts["lastUsed"].label, "-")
    }

}
