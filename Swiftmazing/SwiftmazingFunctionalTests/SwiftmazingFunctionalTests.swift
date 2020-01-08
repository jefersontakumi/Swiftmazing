//
//  SwiftmazingFunctionalTests.swift
//  SwiftmazingFunctionalTests
//
//  Created by Hélio Mesquita on 08/01/20.
//  Copyright © 2020 Hélio Mesquita. All rights reserved.
//

import XCTest
import KIF

@testable import SwiftmazingMock

class SwiftmazingFunctionalTests: KIFTestCase {

    let repository = Repositories().items.first!

    func testAppLoaded() {
        tester().waitForView(withAccessibilityLabel: "Swiftmazing")
        tester().waitForView(withAccessibilityLabel: repository.name)
        tester().waitForView(withAccessibilityLabel: repository.owner.name)
        tester().waitForView(withAccessibilityLabel: repository.stars.kiloFormat)
        tester().waitForView(withAccessibilityLabel: Text.stars.value)
    }

    func testTapOnSeeMoreButton() {
        tester().waitForView(withAccessibilityLabel: "Swiftmazing")
        tester().tapView(withAccessibilityLabel: "See more")
        tester().waitForView(withAccessibilityLabel: repository.name)
        tester().waitForView(withAccessibilityLabel: repository.description)
        tester().waitForView(withAccessibilityLabel: repository.stars.kiloFormat)
        tester().waitForView(withAccessibilityLabel: Text.stars.value)
    }

    func testTapOnFeedRepositoryCell() {
        tester().waitForView(withAccessibilityLabel: "Swiftmazing")
        tester().tapView(withAccessibilityLabel: "FeedRepositoryCell")
        tester().waitForView(withAccessibilityLabel: repository.name)
        tester().waitForView(withAccessibilityLabel: repository.owner.name)
        tester().waitForView(withAccessibilityLabel: repository.description)
        tester().waitForView(withAccessibilityLabel: " - \(repository.stars.kiloFormat) \(Text.stars.value)")
        tester().waitForView(withAccessibilityLabel: " - \(repository.issues.kiloFormat) \(Text.issues.value) ")
        tester().waitForView(withAccessibilityLabel: " - \(repository.forks.kiloFormat) \(Text.forks.value) ")
        tester().waitForView(withAccessibilityLabel: " - \(Text.lastUpdate.value) \(repository.lastUpdate.monthDayYear)")
    }

    func testTapOnNewsCell() {
        tester().waitForView(withAccessibilityLabel: "Swiftmazing")
        tester().tapView(withAccessibilityLabel: "FeedNewsCell")
        tester().waitForView(withAccessibilityLabel: repository.name)
        tester().waitForView(withAccessibilityLabel: repository.description)
        tester().waitForView(withAccessibilityLabel: repository.stars.kiloFormat)
        tester().waitForView(withAccessibilityLabel: Text.stars.value)
    }

    func testTapOnListRepositoryCell() {
        tester().waitForView(withAccessibilityLabel: "Swiftmazing")
        tester().tapView(withAccessibilityLabel: "FeedNewsCell")
        tester().tapView(withAccessibilityLabel: "ListRepositoryCell")
        tester().waitForView(withAccessibilityLabel: repository.name)
        tester().waitForView(withAccessibilityLabel: repository.owner.name)
        tester().waitForView(withAccessibilityLabel: repository.description)
        tester().waitForView(withAccessibilityLabel: " - \(repository.stars.kiloFormat) \(Text.stars.value)")
        tester().waitForView(withAccessibilityLabel: " - \(repository.issues.kiloFormat) \(Text.issues.value) ")
        tester().waitForView(withAccessibilityLabel: " - \(repository.forks.kiloFormat) \(Text.forks.value) ")
        tester().waitForView(withAccessibilityLabel: " - \(Text.lastUpdate.value) \(repository.lastUpdate.monthDayYear)")
    }

}
