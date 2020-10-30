//
//  RecipesListViewController.swift
//  Reciplease
//
//  Created by ousama boujaouane on 29/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

class RecipesListViewController: UIViewController {
    // MARK: - Property
    // var recipes = RecipeEntity.all
    var recipes: Recipes?
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //recipes = RecipeEntity.all
        //tableView.reloadData()
        guard let recipes = recipes else { return }
        
        print(recipes.count)
    }
}
