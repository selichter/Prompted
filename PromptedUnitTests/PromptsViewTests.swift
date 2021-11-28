//
//  PromptsViewTests.swift
//  PromptedUnitTests
//
//  Created by Sarah Lichter on 11/26/21.
//

@testable import Prompted
import XCTest
import ViewInspector

extension PromptsView: Inspectable { }

class PromptsViewTests: XCTestCase {

    func testSomething() throws {
        let view = PromptsView()
        let sut = try view.inspect().find(text: "Today's Prompt").string()
        XCTAssertEqual(sut, "Today's Prompt")
    }
    
    func testPromptIsDisplayedWhenViewAppears() {
        var sut = PromptsView()
        let exp = sut.on(\.didAppear) { view in
            XCTAssertEqual(try view.find(text: "What do I know to be true that I didn’t know a year ago?").string(), "What do I know to be true that I didn’t know a year ago?")
        }
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 0.1)
    }

}
