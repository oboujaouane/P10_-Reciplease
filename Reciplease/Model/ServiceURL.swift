//
//  ServiceURL.swift
//  Reciplease
//
//  Created by ousama boujaouane on 29/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import Foundation

// MARK: - Edamam
class Edamam {
    // MARK: - Properties
    static private let endpoint = "https://api.edamam.com/search"
    static private let appID = "?app_id=\(APIKey.EdamamRecipeSearchAppID)"
    static private let appKey = "&app_key=\(APIKey.EdamamRecipeSearchAppKey)"

    static var url: String {
        return Edamam.endpoint + Edamam.appID + Edamam.appKey
    }
}
