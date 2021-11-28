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
        
        XCTAssert(app.staticTexts["Today's Prompt"].exists)
        XCTAssertEqual(app.staticTexts["prompt"].label, "What do I know to be true that I didn’t know a year ago?")
    }

}
