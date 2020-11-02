//
//  EdamamServiceTestCase.swift
//  RecipleaseTests
//
//  Created by ousama boujaouane on 30/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

@testable import Reciplease
import Mockingjay
import XCTest

class EdamamServiceTestCase: XCTestCase {
    // MARK: - Property
    var ingredients = ["chicken"]
    
    // MARK: - Tests functions
    func testGetRecipesShouldPostFailedCallbackIfError() {
        // Given
        stub(everything, http(500))
        
        // When
        EdamamService.shared.getRecipes(for: ingredients, callback: { success, recipes in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(recipes)
        })
    }
    
    func testGetRecipesShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        // Given
        stub(everything, jsonData(FakeResponseData.recipesCorrectData))
        
        // When
        EdamamService.shared.getRecipes(for: ingredients, callback: { success, recipes in
            //Then
            let q = "chicken"
            let from = 0
            let to = 10
            let more = true
            let count = 120230111
            
            XCTAssertTrue(success)
            XCTAssertNotNil(recipes)
            XCTAssertEqual(q, recipes?.q)
            XCTAssertEqual(from, recipes?.from)
            XCTAssertEqual(to, recipes?.to)
            XCTAssertEqual(more, recipes?.more)
            XCTAssertEqual(count, recipes?.count)
        })
    }
    
    func testGetImageShouldPostSuccessCallbackIfNoErrorAndCorrectImageData() {
        // Given
        stub(everything, jsonData(FakeResponseData.correctImageData))
        
        // When
        let expectation = XCTestExpectation(description: "Alamofire get image")
        EdamamService.shared.getImage(url: "fakeUrl") { image in
            // Then
            XCTAssertNotNil(image)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
}
