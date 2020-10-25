//
//  RecipeEntity.swift
//  Reciplease
//
//  Created by ousama boujaouane on 25/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import CoreData

class RecipeEntity: NSManagedObject {

    static func save(_ recipe: Recipe) {
        let recipeEntity = RecipeEntity(context: AppDelegate.viewContext)
        recipeEntity.image_url = recipe.image
        for ingredient in recipe.ingredientLines {
            recipeEntity.ingredient_lines! += "\(ingredient) " // TODO: remove exclamation
        }
        recipeEntity.name = recipe.label
        recipeEntity.original_url = recipe.url
        recipeEntity.preparation_time = Int16(recipe.totalTime)
        recipeEntity.yield = Int16(recipe.yield)
        saveContext()
    }

    static var all: [RecipeEntity] {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        guard let recipes = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        return recipes
    }

    static func saveContext() {
            try? AppDelegate.viewContext.save()
    }
}
