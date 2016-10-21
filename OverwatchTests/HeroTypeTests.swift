//
//  HeroTypeTests.swift
//  Overwatch
//
//  Created by Jim Campagno on 10/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import XCTest
@testable import Overwatch


class HeroTypeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testOffense() {
        let offense = HeroType.offense
        XCTAssertEqual(offense.description, "Offense: 💥")
    }
    
    func testDefense() {
        let offense = HeroType.defense
        XCTAssertEqual(offense.description, "Defense: 🛡")
    }
    
    func testSupport() {
        let offense = HeroType.support
        XCTAssertEqual(offense.description,"Support: 🚑")
    }
    
    func testTank() {
        let offense = HeroType.tank
        XCTAssertEqual(offense.description, "Tank: 🐼")
    }
    
    func testAllTypes() {
        let allTypes: [HeroType] = [.offense, .defense, .tank, .support]
        XCTAssertEqual(HeroType.allTypes, allTypes)
    }
    
}
