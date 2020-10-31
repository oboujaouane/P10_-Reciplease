//
//  RecipeTableViewCell.swift
//  Reciplease
//
//  Created by ousama boujaouane on 31/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ingredientsLabel: UILabel!
    @IBOutlet private weak var servingsLabel: UILabel!
    @IBOutlet private weak var totalTimeLabel: UILabel!
    @IBOutlet private weak var backgroundImageView: UIImageView!
    
    /// Allow to display information in cells
    func configure(recipe: Recipe) {
        titleLabel.text = recipe.label
        ingredientsLabel.text? = ""
        for ingredient in recipe.ingredientLines {
            ingredientsLabel.text? += "\(ingredient), "
        }
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
    }
    
    /// Network call to load image for cells
    func imageForCell(recipeUrl: String) {
        EdamamService.shared.getImage(url: recipeUrl, callback: { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let image = image {
                    self.backgroundImageView.image = image
                }
            }
        })
    }
}

func minutesToHoursMinutes (minutes : Int) -> (hours : Int , leftMinutes : Int) {
    return (minutes / 60, (minutes % 60))
}
