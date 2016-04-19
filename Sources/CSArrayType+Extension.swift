// Originally based on CryptoSwift by Marcin Krzyżanowski <marcin.krzyzanowski@gmail.com>
// Copyright (C) 2014 Marcin Krzyżanowski <marcin.krzyzanowski@gmail.com>
// This software is provided 'as-is', without any express or implied warranty.
//
// In no event will the authors be held liable for any damages arising from the use of this software.
//
// Permission is granted to anyone to use this software for any purpose,including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:
//
// - The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation is required.
// - Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
// - This notice may not be removed or altered from any source or binary distribution.

import Foundation


public protocol CSArrayType: _ArrayProtocol {
    func cs_arrayValue() -> [Generator.Element]
}

extension Array: CSArrayType {
    public func cs_arrayValue() -> [Iterator.Element] {
        return self
    }
}

public extension CSArrayType where Iterator.Element == UInt8 {
    public var hexString: String {
        #if os(Linux)
            return self.lazy.reduce("") { $0 + (NSString(format:"%02x", $1).description) }
        #else
            return self.lazy.reduce("") { $0 + String(format:"%02x", $1) }
        #endif
    }
    
    public var base64: String? {
        guard let bytesArray = self as? [UInt8] else {
            return nil
        }
        
        #if os(Linux)
            return NSData(bytes: bytesArray).base64EncodedStringWithOptions([])
        #else
            return NSData(bytes: bytesArray).base64EncodedString([])
        #endif
    }
    
    public init(base64: String) {
        self.init()
        
        #if os(Linux)
            guard let decodedData = NSData(base64EncodedString: base64, options: []) else {
                return
            }
        #else
            guard let decodedData = NSData(base64Encoded: base64, options: []) else {
                return
            }
        #endif
        
        self.append(contentsOf: decodedData.byteArray)
    }
}