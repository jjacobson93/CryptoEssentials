//
//  CollectionTests.swift
//  MongoKitten
//
//  Created by Joannis Orlandos on 23/03/16.
//  Copyright © 2016 PlanTeam. All rights reserved.
//

import XCTest
import Foundation
import CryptoEssentials

class CollectionTests: XCTestCase {
    static var allTests: [(String, CollectionTests -> () throws -> Void)] {
        return [
                   ("testBase64", testBase64),
                   ("testNSData", testNSData),
                   ("testHexString", testHexString),
        ]
    }
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testBase64() {
        let data = [UInt8]("Swift programming is awesome".utf8)
        
        XCTAssertEqual(data.base64, "U3dpZnQgcHJvZ3JhbW1pbmcgaXMgYXdlc29tZQ==")
    }
    
    func testNSData() {
        let data = NSData.makeNSData(fromBase64: "U3dpZnQgcHJvZ3JhbW1pbmcgaXMgYXdlc29tZQ==")
        XCTAssertEqual(data.byteArray, [UInt8]("Swift programming is awesome".utf8))
    }
    
    // Using http://www.mathsisfun.com/binary-decimal-hexadecimal-converter.html
    func testHexString() {
        let data = [UInt8]("kaas".utf8)
        
        XCTAssertEqual(data.hexString.uppercased(), "6B616173")
    }
}