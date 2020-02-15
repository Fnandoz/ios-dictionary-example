//
//  EnglishDictionaryTests.swift
//  EnglishDictionaryTests
//
//  Created by Fernando Gomes on 08/02/20.
//  Copyright © 2020 Fernando Gomes. All rights reserved.
//

import XCTest
@testable import EnglishDictionary

class EnglishDictionaryTests: XCTestCase {

    var searchVM: SearchViewModelProtocol?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        searchVM = SearchViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        searchVM?.searchWord(searchModel: SearchModel(word: "task")) { (success, error) in
            print(success)
            XCTAssertNil(success)
            XCTAssertNil(error)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
