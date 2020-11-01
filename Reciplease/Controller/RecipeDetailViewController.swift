//
//  RecipeDetailViewController.swift
//  Reciplease
//
//  Created by ousama boujaouane on 31/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet private weak var recipeImageView: UIImageView!
    @IBOutlet private weak var servingsLabel: UILabel!
    @IBOutlet private weak var totalTimeLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Action
    @IBAction func getDirectionsTouched() {
        guard let stringUrl = recipe?.url else { return }
        guard let url = URL(string: stringUrl) else { return }
        UIApplication.shared.open(url)
    }
    
    // MARK: - Properties
    var recipe: Recipe?
    var recipeImage: UIImage?
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareView()
    }
    
    deinit {
        print("RecipeDetailViewController deinit called")
    }
    
    // MARK: - Private functions
    private func prepareView() {
        guard let recipe = recipe else { return }
        
        servingsLabel.text = "\(String(recipe.yield)) servings"
        let totalTime = minutesToHoursMinutes(minutes: recipe.totalTime)
        if totalTime.hours == 0 && totalTime.leftMinutes == 0 {
            totalTimeLabel.isHidden = true
        } else {
            totalTimeLabel.isHidden = false
            if totalTime.hours == 0 {
                totalTimeLabel.text = "\(totalTime.leftMinutes) minutes"
            } else if totalTime.leftMinutes == 0 {
                totalTimeLabel.text = "\(totalTime.hours) hour"
            } else {
                totalTimeLabel.text = "\(totalTime.hours)h\(totalTime.leftMinutes)"
            }
        }
        titleLabel.text = recipe.label
        recipeImageView.image = recipeImage
    }
}

// MARK: - Extension allowing to congigure table view and cells details
extension RecipeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let recipeIngredientCell = tableView.dequeueReusableCell(withIdentifier: "IngredientsTableViewCellIdentifier",
                                                            for: indexPath) as? IngredientsTableViewCell else {
                                                                return UITableViewCell()
        }
        
        guard let recipe = recipe else {
            return UITableViewCell()
        }
        
        recipeIngredientCell.configure(recipe.ingredientLines)
        
        return recipeIngredientCell
    }
}
