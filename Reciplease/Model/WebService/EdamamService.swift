//
//  EdamamService.swift
//  Reciplease
//
//  Created by ousama boujaouane on 29/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import Alamofire

class EdamamService {
    // MARK: - Properties
    static var shared = EdamamService()
    private init() {}
    
    // MARK: - Internal functions
    func getRecipes(for ingredients: [String], callback: @escaping (Bool, Recipes?) -> Void) {
        let ingredientsParameter = ["app_key": APIKey.EdamamRecipeSearchAppKey,
                                    "app_id": APIKey.EdamamRecipeSearchAppID,
                                    "q": ingredients.joined(separator: ",")]
        
        AF.request(Edamam.endpoint, method: .get, parameters: ingredientsParameter)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                guard let data = response.data else {
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let recipes = try decoder.decode(Recipes.self, from: data)
                    callback(true, recipes)
                } catch {
                    callback(false, nil)
                }
        }
    }
    
    func getImage(url: String, callback: @escaping ((UIImage?) -> Void)) {
        AF.download(url).responseData { response in
            if let data = response.value {
                let image = UIImage(data: data)
                callback(image)
            }
        }
    }
}
