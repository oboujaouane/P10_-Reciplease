//
//  RecipesListViewController.swift
//  Reciplease
//
//  Created by ousama boujaouane on 29/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

class RecipesListViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet private weak var recipesTableView: UITableView!
    
    // MARK: - Properties
    // var recipes = RecipeEntity.all
    private var selectedRecipe: Recipe?
    private var selectedRecipeImage: UIImage?
    var hits: [Hit]?
    private let segueIdentifier = "segueToRecipeDetail"
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let recipeDetailVC = segue.destination as! RecipeDetailViewController
            recipeDetailVC.recipe = selectedRecipe
            recipeDetailVC.recipeImage = selectedRecipeImage
        }
    }
    
    deinit {
        print("RecipesListViewController deinit called")
    }
    
    // MARK: - Function
    private func setupTableView() {
        recipesTableView.rowHeight = 200
        recipesTableView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: "RecipeTableViewCellIdentifier")
    }
}


// MARK: - Extension allowing to congigure table view and cells details
extension RecipesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        hits?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let recipeCell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCellIdentifier",
                                                            for: indexPath) as? RecipeTableViewCell else {
                                                                return UITableViewCell()
        }
        
        guard let hits = hits else {
            return UITableViewCell()
        }
        
        recipeCell.imageForCell(recipeUrl: (hits[indexPath.row].recipe.image))
        recipeCell.configure(recipe: hits[indexPath.row].recipe)
        
        return recipeCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRecipe = hits?[indexPath.row].recipe
        selectedRecipeImage = (tableView.cellForRow(at: indexPath) as! RecipeTableViewCell).backgroundImageView.image
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}
