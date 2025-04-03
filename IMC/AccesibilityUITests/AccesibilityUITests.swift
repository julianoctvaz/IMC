//
//  AccesibilityUITests.swift
//  AccesibilityUITests
//
//  Created by Juliano on 03/04/25.
//

import XCTest

final class AccessibilityUITests: XCTestCase {

    func testGreetingButtonExistsAndCanBeTapped() {
        let app = XCUIApplication()
        app.launch()

        let greetingButton = app.buttons["GreetingButton"]

        XCTAssertTrue(greetingButton.exists)
        greetingButton.tap()
    }
}
