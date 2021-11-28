//
//  PromptsViewModelTests.swift
//  PromptedUnitTests
//
//  Created by Sarah Lichter on 11/26/21.
//

@testable import Prompted
import XCTest

class PromptsViewModelTests: XCTestCase {

    func testPromptsInitializesWithEmptyArray() {
        let vm = PromptsViewModel()
        XCTAssert(vm.prompts.isEmpty)
    }
    
    func testLoadPromptsSeedsPromptsArray() {
        let vm = PromptsViewModel()
        vm.loadPrompts()
        XCTAssertFalse(vm.prompts.isEmpty)
        XCTAssertNotEqual(vm.displayedPrompt.id, vm.defaultPrompt.id)
    }
    
    func testAdvancePromptSetsTheDisplayedPrompt() {
        let vm = PromptsViewModel()
        vm.loadPrompts()
        XCTAssertEqual(vm.displayedPrompt.id, 0)
        XCTAssertEqual(vm.displayedPrompt.text, "What do I know to be true that I didn’t know a year ago?")
        vm.advancePrompt()
        XCTAssertEqual(vm.displayedPrompt.id, 1)
        XCTAssertEqual(vm.displayedPrompt.text, "What distractions get in the way of being my most productive?")
    }
    
    func testSetDateUsedPutsDateOnDisplayedPromptAndAdvances() {
        let vm = PromptsViewModel()
        vm.loadPrompts()
        XCTAssertEqual(vm.displayedPrompt.id, 0)
        XCTAssertNil(vm.displayedPrompt.lastUsed)
        let now = Date()
        vm.setDateUsed(date: now)
        let prompt = vm.prompts.first { $0.id == 0 }
        XCTAssertEqual(prompt?.lastUsed, now)
        XCTAssertEqual(vm.displayedPrompt.id, 1)
    }

}
