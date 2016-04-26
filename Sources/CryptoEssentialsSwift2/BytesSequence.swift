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
#if !swift(>=3.0)
import Foundation


//TODO: func anyGenerator is renamed to AnyGenerator in Swift 2.2, until then it's just dirty hack for linux (because swift >= 2.2 is available for Linux)
public func CS_AnyGenerator<Element>(body: () -> Element?) -> AnyGenerator<Element> {
    return AnyGenerator(body: body)
}

public struct BytesSequence: SequenceType {
    let chunkSize: Int
    let data: [UInt8]
    
    public init(chunkSize: Int, data: [UInt8]) {
        self.chunkSize = chunkSize
        self.data = data
    }
    
    public func generate() -> AnyGenerator<ArraySlice<UInt8>> {
        var offset:Int = 0
        
        return CS_AnyGenerator {
            let end = Swift.min(self.chunkSize, self.data.count - offset)
            let result = self.data[offset..<offset + end]
            offset += result.count
            return result.count > 0 ? result : nil
        }
    }
    }
#endif