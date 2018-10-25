//
//  ExamplUITests.swift
//  ExamplUITests
//
//  Created by Admin on 19/10/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import XCTest

class ExamplUITests: XCTestCase {

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
    
    func test_UI_Exists() {
        let app = XCUIApplication()
        XCTAssertTrue(app.buttons["💛"].exists)
        XCTAssertTrue(app.buttons["Next"].exists)
        XCTAssertTrue(app.otherElements.containing(.image, identifier: "image1").element.exists)
    }
    

    func test_Check_ButtonNext() {
        let app = XCUIApplication()
        let nextButton = app.buttons["Next"]
        nextButton.tap()
        nextButton.tap()
    }
    
    func test_Check_ButtonLike() {
        let app = XCUIApplication()
        let likeButton1 = app.buttons["💛"]
        likeButton1.tap()
        
        let likeButton2 = app.buttons["❤️"]
        likeButton2.tap()
    }
    
}
