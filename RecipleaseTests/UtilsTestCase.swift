//
//  UtilsTestCase.swift
//  RecipleaseTests
//
//  Created by ousama boujaouane on 02/11/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

@testable import Reciplease
import XCTest

class UtilsTestCase: XCTestCase {

    // MARK: - Tests functions
    func testGivenRecipeTimeInMinutes_WhenSixtyMinutes_ThenRecipeTimeShouldReturnOneHourAndZeroMinute() {
        let recipeTime = Utils.minutesToHoursMinutes(minutes: 60)
        XCTAssertEqual(recipeTime.hours, 1)
        XCTAssertEqual(recipeTime.leftMinutes, 0)
    }
    
    func testGivenRecipePreparationTime_WhenZeroMinutes_ThenRecipeTimeSentenceShouldReturnEmptyString() {
        let totalTimeSentence = Utils.getTotalTimeStringSentence(for: 0)
        XCTAssertEqual(totalTimeSentence.text, "")
    }
    
    func testGivenRecipePreparationTime_WhenFiftyMinutes_ThenRecipeTimeSentenceShouldReturn50MinutesString() {
        let totalTimeSentence = Utils.getTotalTimeStringSentence(for: 50)
        XCTAssertEqual(totalTimeSentence.text, "50 minutes")
    }
    
    func testGivenRecipePreparationTime_WhenSixtyMinutes_ThenRecipeTimeSentenceShouldReturn1HourString() {
        let totalTimeSentence = Utils.getTotalTimeStringSentence(for: 60)
        XCTAssertEqual(totalTimeSentence.text, "1 hour")
    }
    
    func testGivenRecipePreparationTime_WhenHundredMinutes_ThenRecipeTimeSentenceShouldReturn1H40String() {
        let totalTimeSentence = Utils.getTotalTimeStringSentence(for: 100)
        XCTAssertEqual(totalTimeSentence.text, "1h40")
    }
}
