//
//  HeroNameTests.swift
//  Overwatch
//
//  Created by Jim Campagno on 10/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import XCTest
@testable import Overwatch

class HeroNameTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGenji() {
        let genji = HeroName.genji
        XCTAssertEqual(genji.description, "Genji")
    }
    
    func testTorbjorn() {
        let torb = HeroName.torbjörn
        XCTAssertEqual(torb.description, "Torbjörn")
    }
        
    func testZarya() {
        let zarya = HeroName.zarya
        XCTAssertEqual(zarya.description, "Zarya")
    }
    
}
