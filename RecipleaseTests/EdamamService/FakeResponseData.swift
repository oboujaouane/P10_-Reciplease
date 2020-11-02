//
//  FakeResponseData.swift
//  RecipleaseTests
//
//  Created by ousama boujaouane on 01/11/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import Foundation
import UIKit

class FakeResponseData {
    // MARK: - Static properties
    static var recipesCorrectData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "EdamamRecipes", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static var correctImageData: Data {
        let launchscreen_icon = #imageLiteral(resourceName: "launchscreen_icon.pdf")
        return launchscreen_icon.pngData()!
    }
    
    static var nilData: Data? = nil
    
}
