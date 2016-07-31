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



public protocol BitshiftOperationsProtocol {
    static func <<(lhs: Self, rhs: Self) -> Self
    static func >>(lhs: Self, rhs: Self) -> Self
    
    static func <<=( lhs: inout Self, rhs: Self)
    static func >>=( lhs: inout Self, rhs: Self)
}

public protocol ByteConvertible {
    init(_ value: UInt8)
    init(truncatingBitPattern: UInt64)
}

extension Int    : BitshiftOperationsProtocol, ByteConvertible { }
extension Int8   : BitshiftOperationsProtocol, ByteConvertible { }
extension Int16  : BitshiftOperationsProtocol, ByteConvertible { }
extension Int32  : BitshiftOperationsProtocol, ByteConvertible { }

extension UInt   : BitshiftOperationsProtocol, ByteConvertible { }
extension UInt8  : BitshiftOperationsProtocol, ByteConvertible { }
extension UInt16 : BitshiftOperationsProtocol, ByteConvertible { }
extension UInt32 : BitshiftOperationsProtocol, ByteConvertible { }
extension UInt64 : BitshiftOperationsProtocol, ByteConvertible {
    public init(truncatingBitPattern value: UInt64) {
        self = value
    }
}
