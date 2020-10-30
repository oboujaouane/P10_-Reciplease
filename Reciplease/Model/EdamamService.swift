//
//  EdamamService.swift
//  Reciplease
//
//  Created by ousama boujaouane on 29/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import Foundation
import Alamofire

class EdamamService {
    // MARK: - Properties
    static var shared = EdamamService()
    private init() {}
    
    func getRecipes(for ingredients: [String], callback: @escaping (Bool, Recipes?) -> Void) {
        let ingredientsParameter = ["app_key": APIKey.EdamamRecipeSearchAppKey,
                                    "app_id": APIKey.EdamamRecipeSearchAppID,
                                    "q": ingredients.joined(separator: ",")]
        AF.request(Edamam.endpoint, method: .get, parameters: ingredientsParameter).validate().responseJSON { response in
            guard let data = response.data, response.error == nil else {
                callback(false, nil)
                return
            }

            guard let response = response.response, response.statusCode == 200 else {
                callback(false, nil)
                return
            }

            guard let recipes = try? JSONDecoder().decode(Recipes.self, from: data) else {
                callback(false, nil)
                return
            }

            callback(true, recipes)
        }
    }

    // TODO: Call it and finalise
    func getImage(url: String, callback: @escaping ((UIImage?) -> Void)) {
        AF.download(url).responseData { response in
            if let data = response.value {
                let image = UIImage(data: data)
                callback(image)
            }
        }
    }
}
