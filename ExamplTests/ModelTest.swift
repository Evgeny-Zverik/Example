//
//  ModelTest.swift
//  ExamplUITests
//
//  Created by Admin on 10/12/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import XCTest

@testable import Exampl

class ModelTest: XCTestCase {
    
    var model: Model!
    let testUrl = "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg"
    
    override func setUp() {
        model = Model(image: nil, like: true, index: 0)
    }
    
    override func tearDown() {
        model = nil
    }
    
    func testInitLike() {
        XCTAssertNotNil(model.like)
    }
    
    func testInitIndex() {
        XCTAssertNotNil(model.index)
    }
    
    func testWhenGivenSetsLike() {
        XCTAssertEqual(model.like, true)
    }
    
    func testWhenGivenSetsIndex() {
        XCTAssertEqual(model.index, 0)
    }
    
    func testCheckSouceModel() {
        XCTAssertNotNil(SouceModel.imageURLs.first)
    }
    
    func testFirstUrlInSourceModel() {
        XCTAssertEqual(SouceModel.imageURLs.first, testUrl)
    }
    
}
