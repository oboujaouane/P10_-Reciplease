//
//  IngredientsTableViewCell.swift
//  Reciplease
//
//  Created by ousama boujaouane on 31/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var ingredientsLabel: UILabel!

    // MARK: - Internal function
    func configure(_ ingredientLines: [String]) {
        ingredientsLabel.text = ""
        for ingredientLine in ingredientLines {
            ingredientsLabel.text! += "\n- " + ingredientLine.capitalizingFirstLetter()
        }
    }
}
