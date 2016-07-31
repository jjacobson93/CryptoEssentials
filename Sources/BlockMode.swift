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

public typealias CipherBlockOperation = (block: [UInt8]) -> [UInt8]?

public protocol BlockMode {
    static var options: BlockModeOptions { get }
    static var blockType: InputBlockType { get }
    
    static func makeDecryptionIterator(iv: [UInt8], cipherOperation: CipherBlockOperation, inputGenerator: AnyIterator<[UInt8]>) -> AnyIterator<[UInt8]>
    
    static func makeEncryptionIterator(iv: [UInt8], cipherOperation: CipherBlockOperation, inputGenerator: AnyIterator<[UInt8]>) -> AnyIterator<[UInt8]>
}

public enum InputBlockType {
    case encrypt
    case decrypt
}

public struct BlockModeOptions: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let none = BlockModeOptions(rawValue: 0)
    public static let initializationVectorRequired = BlockModeOptions(rawValue: 1)
    public static let paddingRequired = BlockModeOptions(rawValue: 2)
}
