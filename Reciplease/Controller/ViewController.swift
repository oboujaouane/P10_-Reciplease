//
//  ViewController.swift
//  Reciplease
//
//  Created by ousama boujaouane on 25/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Property
    var recipes = RecipeEntity.all
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recipes = RecipeEntity.all
        //tableView.reloadData()
    }

}
