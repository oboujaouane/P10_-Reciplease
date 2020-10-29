//
//  ViewController.swift
//  Reciplease
//
//  Created by ousama boujaouane on 25/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    // MARK: - Actions
    @IBAction func searchRecipes() {
        EdamamService.shared.getRecipes(for: ["chicken"], callback: { [weak self]  success, recipes in
            guard let self = self else { return }
            
            if success, let recipes = recipes {
//                print(recipes)
                print(recipes.hits[0].bookmarked)
            } else {
                self.presentAlert(title: "Petit problème lors de la récupération des recettes",
                                  message: "Veuillez revenir à la vue précédente et réitérer votre recherche.",
                                  buttonTitle: "OK")
            }
        })
    }
}
