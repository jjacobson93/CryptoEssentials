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

final public class PCBC: BlockMode {
    public static let options: BlockModeOptions = [.initializationVectorRequired, .paddingRequired]
    public static let blockType = InputBlockType.decrypt
    
    public static func makeEncryptionIterator(iv: [UInt8], cipherOperation: CipherBlockOperation, inputGenerator: AnyIterator<[UInt8]>) -> AnyIterator<[UInt8]> {
        var prevCipherText: [UInt8]? = nil
        
        return AnyIterator {
            guard let plaintext = inputGenerator.next(),
                let encrypted = cipherOperation(block: xor(prevCipherText ?? iv, plaintext))
                else {
                    return nil
            }
            
            prevCipherText = xor(plaintext, encrypted)
            return encrypted
        }
    }
    
    public static func makeDecryptionIterator(iv: [UInt8], cipherOperation: CipherBlockOperation, inputGenerator: AnyIterator<[UInt8]>) -> AnyIterator<[UInt8]> {
        var prevCipherText: [UInt8]? = nil
        
        return AnyIterator {
            guard let ciphertext = inputGenerator.next(),
                let decrypted = cipherOperation(block: ciphertext)
                else {
                    return nil
            }
            
            let plaintext = xor(prevCipherText ?? iv, decrypted)
            prevCipherText = xor(plaintext, ciphertext)
            return plaintext
        }
    }
}