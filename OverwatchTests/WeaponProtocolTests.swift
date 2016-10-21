//
//  WeaponProtocolTests.swift
//  Overwatch
//
//  Created by Jim Campagno on 10/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import XCTest
@testable import Overwatch

class WeaponProtocolTests: XCTestCase {
    
    //Dummy Struct which adopts/conforms to Weapon
    struct TestStruct: Weapon {
        func fire() -> String {
            return "bang"
        }
        func heal() -> String {
            return "<3"
        }
    }
    
    var testDummy: TestStruct!
    
    override func setUp() {
        super.setUp()
        testDummy = TestStruct()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFire() {
        XCTAssertEqual(testDummy.fire(), "bang", "The Weapon protocol should require any adopting type to implement fire()")
    }
    
    func testHeal() {
        XCTAssertEqual(testDummy.heal(), "<3", "The Weapon protocol should require any adopting type to implement heal()")
    }

    
}
