//
//  ViewModelTest.swift
//  ExamplTests
//
//  Created by Admin on 13/12/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import XCTest

@testable import Exampl

class ViewModelTest: XCTestCase {
    
    var view: ViewController!
    var sut: ViewModel!

    override func setUp() {
        view = ViewController()
        sut = ViewModel(view: view)
    }

    override func tearDown() {
        view = nil
        sut = nil
    }

    func testStartImageString() {
        XCTAssertEqual(sut.startImage, "image1")
    }
    
    func testLikeTitleString() {
        let model = Model(like: true, index: 0)
        sut.model = model
        XCTAssertEqual(sut.likeTitle, "❤️")
    }
    
    func testCurentImage() {
        let imageData = UIImage(named: "image1")?.pngData()
        let model = Model(image: imageData, like: false, index: 0)
        sut.model = model
        XCTAssertEqual(sut.curentImage, imageData)
    }


}
