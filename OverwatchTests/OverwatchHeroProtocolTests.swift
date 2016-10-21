//
//  OverwatchHeroProtocolTests.swift
//  Overwatch
//
//  Created by Jim Campagno on 10/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import XCTest
@testable import Overwatch

class OverwatchHeroProtocolTests: XCTestCase {
    
    // Dummy struct which adopts/conforms to OverwatchHero
    struct DummyOW: OverwatchHero {
        var name: HeroName
        var hitPoints: Health
        var heroType: HeroType {
            return .tank
        }
    }
    
    var dummyOW: DummyOW!
    
    override func setUp() {
        super.setUp()
        dummyOW = DummyOW(name: .zarya, hitPoints: 5)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testName() {
        XCTAssertEqual(dummyOW.name, .zarya, "The OverwatchHero protocol should require any adopting type to have a name stored property of type HeroName")
    }
    
    func testHitPoints() {
        XCTAssertEqual(dummyOW.hitPoints, 5, "The OverwatchHero protocol should require any adopting type to have a hitPoints stored property of type Health")
    }
    
    func testHeroType() {
        XCTAssertEqual(dummyOW.heroType, .tank, "The OverwatchHero protocol should require any adopting type to have a heroType read-only computed property of type HeroType.")
    }

    func testFire() {
        XCTAssertEqual(dummyOW.fire(), "Tank: ✊🏽", "THe OverwatchHero protocol should through an extension provide a default implementation to the fire() method.")
    }
    
    func testHeal() {
        XCTAssertEqual(dummyOW.heal(), "Heal: ✖️", "THe OverwatchHero protocol should through an extension should provide a default implementation to the heal() method.")
    }
    
    func testProduceHeroType() {
        XCTAssertEqual(dummyOW.produceHeroType(), .tank, "The OverwatchHero protocol through an extension should provide a default implementation to the produceHeroType() function based upon the value of the name stored property.")
    }
    
    func testProduceInitialHitPoints() {
        XCTAssertEqual(dummyOW.produceInitialHitPoints(), 500, "The OverwatchHero protocol through an extension should provide a default implementation to the produceInitialHitPoints() function based upon the value of the heroType stored property.")
    }
    
    func testProduceDescription() {
        let description = "Name: Zarya\nType: Tank: 🐼\nAttack: Tank: ✊🏽\nHeal: Heal: ✖️\nHit Points: 5"
        XCTAssertEqual(dummyOW.description, description, "The OverwatchHero protocol through an extension should provide a default implementation to the read-only computed property description of type String")
    }
    
}
