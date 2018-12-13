//
//  ViewControllerTest.swift
//  ExamplTests
//
//  Created by Admin on 13/12/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import XCTest

@testable import Exampl

class ViewControllerTest: XCTestCase {
    
    var sut: ViewController!

    override func setUp() {
        sut = ViewController(nibName: nil, bundle: nil)
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
    }

    func testHasImageView() {
        XCTAssertTrue(sut.imageView.isDescendant(of: sut.view))
    }
    
    func testHasLikeButton() {
        XCTAssertTrue(sut.likeButton.isDescendant(of: sut.view))
    }
    
    func testHasNextPictureButton() {
        XCTAssertTrue(sut.nextPictureButton.isDescendant(of: sut.view))
    }
    
    func testLikeButtonAction() {
        let likeButtonAction = sut.likeButton
        
        guard let action = likeButtonAction.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(action.contains("onLikeAction"))
    }
    
    func testNextPictureButton() {
        let nextPictureButton = sut.nextPictureButton
        
        guard let action = nextPictureButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(action.contains("nextButtonAction"))
    }
    
    func textNextPicture() {
        
        
        XCTAssertTrue(sut.nextPicture())
    }

}
