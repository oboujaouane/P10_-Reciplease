//
//  FakeResponseData.swift
//  RecipleaseTests
//
//  Created by ousama boujaouane on 30/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import Foundation
import Mocker

//class FakeResponseData {
//    // MARK: - HTTP status code
//    static let responseOK = HTTPURLResponse(
//        url: URL(string: "https://openclassrooms.com")!,
//        statusCode: 200,
//        httpVersion: nil,
//        headerFields: nil)!
//
//    static let responseKO = HTTPURLResponse(
//        url: URL(string: "https://openclassrooms.com")!,
//        statusCode: 500,
//        httpVersion: nil,
//        headerFields: nil)!
//
//    // MARK: - Error
//    class SimpleError: Error {}
//    static let error = SimpleError()
//
//    // MARK: - Incorrect data
//    static let incorrectData = "erreur".data(using: .utf8)!
//
//    // MARK: - Edamam
//    static var edamamCorrectData: Data {
//        let bundle = Bundle(for: FakeResponseData.self)
//        let url = bundle.url(forResource: "EdamamRecipes", withExtension: "json")
//        let data = try! Data(contentsOf: url!)
//        return data
//    }
//}

public final class MockedData {
    public static var fakeData: Data {
        let bundle = Bundle(for: MockedData.self)
        let url = bundle.url(forResource: "EdamamRecipes", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    // TODO: add this to mock
//    public static let exampleRecipeImage: URL = Bundle(for: MockedData.self).url(forResource: "wetransfer_bot_avater", withExtension: "png")!
}
