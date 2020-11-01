//
//  EdamamServiceTestCase.swift
//  RecipleaseTests
//
//  Created by ousama boujaouane on 30/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

@testable import Reciplease
import Alamofire
import Mockingjay
import XCTest

class EdamamServiceTestCase: XCTestCase {
    // MARK: - Property
    var ingredients = ["chicken"]
    
    func testGetDataShouldPostFailedCallbackIfError() {
        stub(everything, http(404))
        EdamamService.shared.getRecipes(for: ingredients, callback: { succes, recipes in
            XCTAssertFalse(succes)
            XCTAssertNil(recipes)
        })
    }
}
