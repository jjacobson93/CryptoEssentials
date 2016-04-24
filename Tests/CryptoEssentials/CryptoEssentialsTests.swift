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

class CryptoEssentialsTests: XCTestCase {
    static var allTests: [(String, CryptoEssentialsTests -> () throws -> Void)] {
        return [
                   ("testBase64", testBase64),
                   ("testInvalidBase64", testInvalidBase64),
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
        let iterations = 100
        for _ in 1...iterations {
            let numberOfBytes = Int(drand48()*100)
            var data = [UInt8](repeating: 0, count: numberOfBytes)
            
            // Generate random data
            data = data.map({ _ in UInt8( drand48()*255) })
            
            // Make sure it encodes / decodes properly
            let roundTripData = (try? Base64.decode(Base64.encode(data))) ?? [UInt8]()
            let urlSafeRoundTripData = (try? Base64.decode(Base64.urlSafeEncode(data))) ?? [UInt8]()
            
            XCTAssertEqual(data, roundTripData, "Random data should encode and decode properly")
            XCTAssertEqual(data, urlSafeRoundTripData, "Random data should encode and decode properly")
        }
    }
    
    func testInvalidBase64() {
        let invalidBase64String = "!@#$%^&*("
        XCTAssertNil(try? Base64.decode(invalidBase64String), "We should not try to decode an invalid string")
    }
    
    // Using http://www.mathsisfun.com/binary-decimal-hexadecimal-converter.html
    func testHexString() {
        let data = [UInt8]("kaas".utf8)
        
        XCTAssertEqual(data.hexString.uppercased(), "6B616173")
    }
}