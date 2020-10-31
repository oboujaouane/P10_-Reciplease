//
//  RecipeDetailTableViewController.swift
//  Reciplease
//
//  Created by ousama boujaouane on 31/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

class RecipeDetailTableViewController: UITableViewController {
    // MARK: - Outlet
    @IBOutlet private weak var servingsLabel: UILabel!
    @IBOutlet private weak var totalTimeLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Action
    @IBAction func getDirectionsTouched() {
        print("get directions button touched")
    }
    
    // MARK: - Property
    var recipe: Recipe?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
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
    }
}

// MARK: - Extension allowing to congigure table view and cells details
extension RecipeDetailTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

}
