//
//  ViewController.swift
//  Reciplease
//
//  Created by ousama boujaouane on 25/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var ingredientTextField: UITextField!
    @IBOutlet private weak var ingredientTextView: UITextView!
    @IBOutlet private weak var validateButton: UIButton!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - Properties
    private let segueIdentifier = "segueToRecipes"
    private var ingredientsList: [String] = []
    private var recipes: Recipes?
    
    // MARK: - Actions
    @IBAction func addIngredient() {
        addIngredientToList()
    }
    
    @IBAction func clearList() {
        ingredientsList.removeAll()
        ingredientTextView.text.removeAll()
    }
    
    @IBAction func searchRecipes() {
        loader(shown: true)
        
        if !ingredientsList.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                EdamamService.shared.getRecipes(for: self.ingredientsList, callback: { [weak self]  success, recipes in
                    guard let self = self else { return }
                    
                    if success, let recipes = recipes {
                        if recipes.count > 0 {
                            self.recipes = recipes
                            print(recipes) // TODO: Remove when tests end
                            self.performSegue(withIdentifier: self.segueIdentifier, sender: self)
                        } else {
                            self.presentAlert(title: "Aucune recette",
                                              message: "Désolé mais aucune recette n'a été trouvée avec votre liste d'ingrédients.",
                                              buttonTitle: "OK")
                        }
                    } else {
                        self.presentAlert(title: "Petit problème lors de la récupération des recettes",
                                          message: "Veuillez réitérer votre recherche.",
                                          buttonTitle: "OK")
                    }
                    self.loader(shown: false)
                })
            }
        } else {
            loader(shown: false)
            presentAlert(title: "Liste d'ingrédients vide",
                         message: "Veuillez ajouter au moins un ingrédient à la liste.",
                         buttonTitle: "OK")
        }
    }
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            if let recipesListVC = segue.destination as? RecipesListViewController {
                recipesListVC.recipes = recipes
            }
        }
    }
    
    // MARK: - Private functions
    private func prepareView() {
        ingredientsList.removeAll()
        ingredientTextView.text = ""
    }
    
    private func loader(shown: Bool) {
        validateButton.isHidden = shown
        
        if shown {
            activityIndicatorView.startAnimating()
        } else {
            activityIndicatorView.stopAnimating()
        }
    }
    
    private func removeIngredient(at index: Int) {
        ingredientsList.remove(at: index)
    }
    
    private func add(ingredient: String) {
        ingredientsList.append(ingredient)
    }
    
    private func addIngredientToList() {
        if let ingredientName = ingredientTextField.text?.trimmingCharacters(
            in: .whitespacesAndNewlines).trimmingCharacters(
                in: .punctuationCharacters), !ingredientName.isEmpty {
            ingredientsList.append(ingredientName)
            ingredientTextView.text = ""
            for ingredient in ingredientsList {
                ingredientTextView.text += "\n- " + ingredient.capitalizingFirstLetter()
            }
            ingredientTextField.text = ""
        }
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addIngredientToList()
        ingredientTextView.scrollToBottom()
        textField.resignFirstResponder()
        return true
    }
}
