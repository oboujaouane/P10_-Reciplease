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
        recipeEntity.preparation_time = Int16(recipe.totalTime)
        recipeEntity.yield = Int16(recipe.yield)
        saveContext()
    }
    
    /// Retrieve all recipes stored in Core Data
    static func all() -> [Recipe] {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        guard let favoriteRecipes = try? AppDelegate.viewContext.fetch(request) else { return [] }
        var recipes = [Recipe]()
        for favorite in favoriteRecipes {
            if let name = favorite.name,
                let image = favorite.image_url,
                let url = favorite.original_url,
                let ingredientLines = favorite.ingredient_lines {
                let recipe = Recipe(label: name,
                                    image: image,
                                    url: url,
                                    yield: Int(favorite.yield),
                                    ingredientLines: (ingredientLines.split(separator: ",").map {
                                        String($0)
                                     }),
                                    ingredients: [],
                                    totalTime: Int(favorite.preparation_time))
                recipes.append(recipe)
            }
        }
        return recipes
    }
    
    /// Save recipe in Core Data
     static func addRecipeToFavorite(recipe: Recipe) {
            let favoriteRecipe = RecipeEntity(context: AppDelegate.viewContext)
            favoriteRecipe.name = recipe.label
            favoriteRecipe.preparation_time = Int16(recipe.totalTime)
            favoriteRecipe.yield = Int16(recipe.yield)
            favoriteRecipe.original_url = recipe.url
            favoriteRecipe.image_url = recipe.image
            favoriteRecipe.ingredient_lines = recipe.ingredientLines.joined(separator: ",")
            saveContext()
    }
    
    /// Check if data already exists in Core Data comparing url
    static func existBy(url: String) -> Bool {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        request.predicate = NSPredicate(format: "image_url == %@", url)
        guard let count = try? AppDelegate.viewContext.count(for: request) else {
            return false
        }
        return count > 0
    }

    /// Delete RecipeEntity in Core Data. Use url in parameters to call the right data
    static func deleteBy(url: String) {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        request.predicate = NSPredicate(format: "image_url == %@", url)
        if let favoriteRecipes = try? AppDelegate.viewContext.fetch(request) {
            for recipe in favoriteRecipes {
                AppDelegate.viewContext.delete(recipe)
            }
        }
        saveContext()
    }
    
    static func saveContext() {
        try? AppDelegate.viewContext.save()
    }
}
