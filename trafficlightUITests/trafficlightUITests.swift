//
//  trafficlightUITests.swift
//  trafficlightUITests
//
//  Created by Damien Laughton on 30/04/2019.
//  Copyright © 2019 Damien Laughton. All rights reserved.
//

import XCTest
@testable import trafficlight

class trafficlightUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialStateOfApp() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let app = XCUIApplication()

        XCTAssertEqual(app.staticTexts["StatusLabel"].label, "Stop")

        let redLamp = app.otherElements.containing(.any, identifier: "RedLamp")
        let amberLamp = app.otherElements.containing(.any, identifier: "AmberLamp")
        let greenLamp = app.otherElements.containing(.any, identifier: "GreenLamp")

        XCTAssertTrue(redLamp.element.exists)
        XCTAssertFalse(amberLamp.element.exists)
        XCTAssertFalse(greenLamp.element.exists)
    }

    func testStateOfAppAfterOneNextTap() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let app = XCUIApplication()

        let nextButton = app.buttons["Next"]
        nextButton.tap()

        XCTAssertEqual(app.staticTexts["StatusLabel"].label, "Ready to go")

        let redLamp = app.otherElements.containing(.any, identifier: "RedLamp")
        let amberLamp = app.otherElements.containing(.any, identifier: "AmberLamp")
        let greenLamp = app.otherElements.containing(.any, identifier: "GreenLamp")

        XCTAssertTrue(redLamp.element.exists)
        XCTAssertTrue(amberLamp.element.exists)
        XCTAssertFalse(greenLamp.element.exists)
    }

    func testStateOfAppAfterTwoNextTaps() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let app = XCUIApplication()

        let nextButton = app.buttons["Next"]
        nextButton.tap()
        nextButton.tap()

        XCTAssertEqual(app.staticTexts["StatusLabel"].label, "Go")

        let redLamp = app.otherElements.containing(.any, identifier: "RedLamp")
        let amberLamp = app.otherElements.containing(.any, identifier: "AmberLamp")
        let greenLamp = app.otherElements.containing(.any, identifier: "GreenLamp")

        XCTAssertFalse(redLamp.element.exists)
        XCTAssertFalse(amberLamp.element.exists)
        XCTAssertTrue(greenLamp.element.exists)
    }

    func testStateOfAppAfterThreeNextTaps() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let app = XCUIApplication()

        let nextButton = app.buttons["Next"]
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()

        XCTAssertEqual(app.staticTexts["StatusLabel"].label, "Prepare to stop")

        let redLamp = app.otherElements.containing(.any, identifier: "RedLamp")
        let amberLamp = app.otherElements.containing(.any, identifier: "AmberLamp")
        let greenLamp = app.otherElements.containing(.any, identifier: "GreenLamp")

        XCTAssertFalse(redLamp.element.exists)
        XCTAssertTrue(amberLamp.element.exists)
        XCTAssertFalse(greenLamp.element.exists)
    }

    func testStateOfAppAfterFourNextTaps() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let app = XCUIApplication()

        let nextButton = app.buttons["Next"]
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()

        XCTAssertEqual(app.staticTexts["StatusLabel"].label, "Stop")

        let redLamp = app.otherElements.containing(.any, identifier: "RedLamp")
        let amberLamp = app.otherElements.containing(.any, identifier: "AmberLamp")
        let greenLamp = app.otherElements.containing(.any, identifier: "GreenLamp")

        XCTAssertTrue(redLamp.element.exists)
        XCTAssertFalse(amberLamp.element.exists)
        XCTAssertFalse(greenLamp.element.exists)
    }
}
