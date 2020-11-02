//
//  CoreDataTestCase.swift
//  RecipleaseTests
//
//  Created by ousama boujaouane on 02/11/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

@testable import Reciplease
import CoreData
import XCTest

class CoreDataTestCase: XCTestCase {
    // MARK: - Private property
    private let fakeRecipe = Recipe(label: "Egg chicken",
                            image: "https://www.fakeurl.com/web-img/f08/f08811025f77fe47088dc50833259abd.jpg",
                            url: "fakeUrl",
                            yield: 6,
                            ingredientLines: ["egg", "chicken"],
                            ingredients: [Ingredient(text: "fake", weight: 2.0, image: "fakeImage")],
                            totalTime: 60)
    
    // MARK: - Life cycle
    /// XCTestCase has two methods, setUp() and tearDown(), for setting up your test case before each run and cleaning up any test data afterwards. Since each test gets to start with a clean slate, these methods help make your tests isolated and repeatable.
    override func setUp() {
        RecipeEntity.deleteBy(fakeRecipe.image)
    }
    
    override func tearDown() {
        RecipeEntity.deleteBy(fakeRecipe.image)
    }
    
    // MARK: - Tests functions
    func testGivenFavoritesWhenAddFavoriteThenFavoriteIsAddedAndExists() {
        RecipeEntity.addRecipeToFavorite(fakeRecipe)
        XCTAssertTrue(RecipeEntity.existBy("https://www.fakeurl.com/web-img/f08/f08811025f77fe47088dc50833259abd.jpg"))
    }
}
