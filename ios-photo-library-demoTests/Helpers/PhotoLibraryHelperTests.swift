//
//  PhotoLibraryHelperTests.swift
//  ios-photo-library-demo
//
//  Created by Eiji Kushida on 2017/04/10.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_photo_library_demo

class PhotoLibraryHelperTests: XCTestCase {
    
    let helper = PhotoLibraryHelper()
    let delegate = SpyPhotoLibraryDelegate()
    
    override func setUp() {
        super.setUp()
        helper.delegate = delegate
    }
    
    override func tearDown() {
        super.tearDown()
        helper.delegate = nil
    }
    
    /// フォトライブラリが利用できるか？
    func testIsAvaiable() {
        XCTAssertTrue(helper.isAvaiable())
    }
    
    /// フォトライブラリのインスタンスが生成できるか？
    func testCreatePhotoLibrary_NotNil() {
        XCTAssertNotNil(helper.createPhotoLibrary())
    }
}
