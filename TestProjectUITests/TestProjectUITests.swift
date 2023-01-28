//
//  TestProjectUITests.swift
//  TestProjectUITests
//
//  Created by SF on 01.06.2021.
//

import XCTest

class TestProjectUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testTableView() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let tableView = app.tables["tableView"]
        
        XCTAssert(tableView.cells.count > 0)
        
        let cell = tableView.cells.containing(.cell, identifier: "tableViewCell")
        
        let cellLabelText = cell.staticTexts.element(boundBy: 0).label
        
        XCTAssertEqual(cellLabelText, "Петров Петр")
                
        cell.element(boundBy: 0).tap()
        
        let city = app.staticTexts["labelCity"]
        XCTAssertEqual(city.label, "Москва")
        
        let friendsLabel = app.staticTexts["labelFriends"]
        XCTAssertTrue(friendsLabel.label == "Друзья:")
        
        let nameOfFriendsLabel = app.staticTexts["labelNameOfFriends"]
        XCTAssertNotNil(nameOfFriendsLabel.label)
        
        let labelSettingsOfPage = app.staticTexts["labelSettingsOfPage"]
        XCTAssertTrue(labelSettingsOfPage.label == "Настройки страницы:")
        
        let switchAccesToThePage = app.switches["switchAccesToThePage"]
        XCTAssertTrue(switchAccesToThePage.isSelected == false)
        
        app.swipeDown()
        
        let cellLabelText2 = cell.staticTexts.element(boundBy: 0).label
        
        XCTAssertEqual(cellLabelText2, "Петров Петр")
        
    }
    
}
