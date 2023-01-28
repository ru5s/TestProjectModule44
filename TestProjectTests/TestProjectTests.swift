//
//  TestProjectTests.swift
//  TestProjectTests
//
//  Created by SF on 01.06.2021.
//

import XCTest
@testable import TestProject

class TestProjectTests: XCTestCase {
    
    let testUserMock: UserMock = UserMock(firstName: "Igor", lastName: "Plac", bio: "developer", city: "Moscow", friends: [], isClosed: true)
    let newName = "Rogi"
    let newLastName = "Calp"
    let newCity = "Minsk"
    let newBio = "midle developer"
    let newIsClosed = false
    
    let friendsUserMock: UserMock = UserMock(firstName: "Svelana", lastName: "Sholc", bio: "manager", city: "Paris", friends: [], isClosed: false)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testChangeCity() throws {
        testUserMock.changeCity(newCity)
        XCTAssertTrue(testUserMock.city == newCity)
        XCTAssertTrue(testUserMock.changeCityCalledCount > 0)
        XCTAssertTrue(testUserMock.changeCityCalled == true)
    }
    
    func testChangeClosed() throws {
        testUserMock.changeClosed(newIsClosed)
        XCTAssertFalse(testUserMock.isClosed != newIsClosed)
        testUserMock.changeClosed(true)
        XCTAssertEqual(testUserMock.changeClosedCalledCount, 2)
        XCTAssertTrue(testUserMock.changeClosedCalled == true)
    }
    
    func testChangeName() throws {
        testUserMock.changeName(newName)
        XCTAssertTrue(testUserMock.firstName == newName)
        XCTAssertNotNil(testUserMock.changeNameCalledCount)
        XCTAssertTrue(testUserMock.changeNameCalled == true)
    }
    
    func testChangeLastName() throws {
        testUserMock.changeLastName(newLastName)
        XCTAssertTrue(testUserMock.changeLastNameCalled == true)
        XCTAssertTrue(testUserMock.changeLastNameCalledCount > 0)
    }
    
    func testChangeBio() throws {
        testUserMock.changeBio(newBio)
        testUserMock.changeBio(newBio)
        friendsUserMock.changeBio(newBio)
        XCTAssertTrue(testUserMock.changeBioCalled == true)
        XCTAssertTrue(testUserMock.changeBioCalledCount == 2)
        
        XCTAssertTrue(friendsUserMock.changeBioCalledCount == 1)
    }
    
    func testAddFriends() throws {
        testUserMock.addFriend(friendsUserMock)
        XCTAssertTrue(testUserMock.addFriendCalled == true)
        XCTAssertTrue(testUserMock.addFriendCalledCount > 0)
        
        friendsUserMock.addFriend(testUserMock)
        XCTAssertTrue(friendsUserMock.addFriendCalled == true)
        XCTAssertTrue(friendsUserMock.addFriendCalledCount > 0)
    }
}
