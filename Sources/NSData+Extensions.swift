//
//  PGPDataExtension.swift
//  SwiftPGP
//
//  Created by Marcin Krzyzanowski on 05/07/14.
//  Copyright (c) 2014 Marcin Krzyzanowski. All rights reserved.
//

import Foundation


extension NSMutableData {
    /** Convenient way to append bytes */
    public func append(bytes: [UInt8]) {
        self.append(bytes, length: bytes.count)
    }
}

extension NSData {
    /// Two octet checksum as defined in RFC-4880. Sum of all octets, mod 65536
    public var checksum: UInt16 {
        var s:UInt32 = 0
        var bytesArray = self.bytes
        for i in 0..<bytesArray.count {
            s = s + UInt32(bytesArray[i])
        }
        s = s % 65536
        return UInt16(s)
    }
}

extension NSData {
    public var hexString: String {
        return self.bytes.hexString
    }
    
    public var bytes: [UInt8] {
        let count = self.length / sizeof(UInt8)
        var bytesArray = [UInt8](repeating: 0, count: count)
        self.getBytes(&bytesArray, length:count * sizeof(UInt8))
        return bytesArray
    }
    
    public convenience init(bytes: [UInt8]) {
        self.init(data: NSData.withBytes(bytes))
    }
    
    class public func withBytes(_ bytes: [UInt8]) -> NSData {
        return NSData(bytes: bytes, length: bytes.count)
    }
}