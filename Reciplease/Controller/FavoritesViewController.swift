//
//  FavoritesViewController.swift
//  Reciplease
//
//  Created by ousama boujaouane on 01/11/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var favoritesRecipesTableView: UITableView!
    @IBOutlet private weak var noFavoritesRecipesLabel: UILabel!

    // MARK: - Pivate properties
    private var recipes = RecipeEntity.all()
    private var selectedRecipe: Recipe?
    private var selectedRecipeImage: UIImage?
    private let segueIdentifier = "segueToRecipeDetail"
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let recipeDetailVC = segue.destination as! RecipeDetailViewController
            recipeDetailVC.recipe = selectedRecipe
            recipeDetailVC.recipeImage = selectedRecipeImage
        }
    }
    
    // MARK: - Private functions
    private func prepareView() {
        recipes = RecipeEntity.all()
        favoritesRecipesTableView.reloadData()
        if recipes.count > 0 {
            noFavoritesRecipesLabel.isHidden = true
            favoritesRecipesTableView.isHidden = false
        } else {
            noFavoritesRecipesLabel.isHidden = false
            favoritesRecipesTableView.isHidden = true
        }
    }
    
    private func setupTableView() {
        favoritesRecipesTableView.rowHeight = 200
        favoritesRecipesTableView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: "RecipeTableViewCellIdentifier")
    }
}

// MARK: - Extension allowing to congigure table view and cells details
extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let recipeCell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCellIdentifier",
                                                            for: indexPath) as? RecipeTableViewCell else {
                                                                return UITableViewCell()
        }
        
        recipeCell.imageForCell(recipeUrl: (recipes[indexPath.row].image))
        recipeCell.configure(recipe: recipes[indexPath.row])
        
        return recipeCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRecipe = recipes[indexPath.row]
        selectedRecipeImage = (tableView.cellForRow(at: indexPath) as! RecipeTableViewCell).backgroundImageView.image
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}
