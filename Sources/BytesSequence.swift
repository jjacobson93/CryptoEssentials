//
//  BytesSequence.swift
//  CryptoSwift
//
//  Created by Marcin Krzyzanowski on 26/09/15.
//  Copyright © 2015 Marcin Krzyzanowski. All rights reserved.
//

import Foundation


//TODO: func anyGenerator is renamed to AnyGenerator in Swift 2.2, until then it's just dirty hack for linux (because swift >= 2.2 is available for Linux)
public func CS_AnyGenerator<Element>(_ body: () -> Element?) -> AnyIterator<Element> {
    return AnyIterator(body: body)
}

public struct BytesSequence: Sequence {
    let chunkSize: Int
    let data: [UInt8]
    
    public init(chunkSize: Int, data: [UInt8]) {
        self.chunkSize = chunkSize
        self.data = data
    }
    
    public func makeIterator() -> AnyIterator<ArraySlice<UInt8>> {
        var offset:Int = 0
        
        return CS_AnyGenerator {
            let end = Swift.min(self.chunkSize, self.data.count - offset)
            let result = self.data[offset..<offset + end]
            offset += result.count
            return result.count > 0 ? result : nil
        }
    }
}