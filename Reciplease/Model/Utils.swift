//
//  Utils.swift
//  Reciplease
//
//  Created by ousama boujaouane on 02/11/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

func minutesToHoursMinutes (minutes : Int) -> (hours : Int , leftMinutes : Int) {
    return (minutes / 60, (minutes % 60))
}

func configureTotalTimeLabel(_ recipe: Recipe, for label: UILabel) {
    let totalTime = minutesToHoursMinutes(minutes: recipe.totalTime)
    if totalTime.hours == 0 && totalTime.leftMinutes == 0 {
        label.isHidden = true
    } else {
        label.isHidden = false
        if totalTime.hours == 0 {
            label.text = "\(totalTime.leftMinutes) minutes"
        } else if totalTime.leftMinutes == 0 {
            label.text = "\(totalTime.hours) hour"
        } else {
            label.text = "\(totalTime.hours)h\(totalTime.leftMinutes)"
        }
    }
}
