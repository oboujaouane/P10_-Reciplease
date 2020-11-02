//
//  Recipes.swift
//  Reciplease
//
//  Created by ousama boujaouane on 02/11/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

struct Recipes: Codable {
    let q: String
    let from, to: Int
    let more: Bool
    let count: Int
    let hits: [Hit]
}
