import Foundation

#if !swift(>=3.0)
    
    public typealias SignedInteger = SignedIntegerType
    public typealias UnsignedInteger = UnsignedIntegerType
    public typealias Error = ErrorType
    public typealias _ArrayProtocol = _ArrayType
    public typealias Sequence = SequenceType
    public typealias OptionSet = OptionSetType
    public typealias Integer = IntegerType
    
    extension Array {
        public func index(`where` predicate: (Element) throws -> Bool) rethrows -> Int? {
            return try self.indexOf(predicate)
        }
        
        public mutating func remove(at index: Int) -> Element {
            return self.removeAtIndex(index)
        }
        
        public init(repeating repeatedValue: Element, count: Int) {
            self.init(count: count, repeatedValue: repeatedValue)
        }
        
        public mutating func append<C: CollectionType where C.Generator.Element == Element>(contentsOf newElements: C) {
            self.appendContentsOf(newElements)
        }
        
        public mutating func insert(contentsOf collection: [Generator.Element], at position: Index) {
            self.insertContentsOf(collection, at: position)
        }
        
        public mutating func replaceSubrange(range: Range<Index>, with collection: [Generator.Element]) {
            self.replaceRange(range, with: collection)
        }
        
        public mutating func removeSubrange(range: Range<Index>) {
            self.removeRange(range)
        }
        
        public func reversed() -> [Generator.Element] {
            return self.reverse()
        }
    }
    
    extension _ArrayType {
        public mutating func append<S : SequenceType where S.Generator.Element == Generator.Element>(contentsOf collection: S) {
            self.appendContentsOf(collection)
        }
    }
    
    extension SequenceType {
        public func enumerated() -> EnumerateSequence<Self> {
            return enumerate()
        }
    }
    
    extension String {
        public func components(separatedBy separator: String) -> [String] {
            return self.componentsSeparatedByString(separator)
        }
    }
    
    extension SequenceType {
        public func makeIterator() -> Generator {
            return self.generate()
        }
    }
    
    extension SequenceType where Generator.Element == String {
        public func joined(separator separator: String) -> String {
            return self.joinWithSeparator(separator)
        }
    }
    
    extension NSData {
        @objc(kaas:koekjes:salade:) public func write(toFile path: String, options writeOptionsMask: NSDataWritingOptions = []) throws {
            try self.writeToFile(path, options: writeOptionsMask)
        }
    }
    
    extension UnsafePointer {
        public typealias Pointee = Memory
        public var pointee: Pointee {
            return self.memory
        }
    }
    
    extension CollectionType where Generator.Element : Equatable {
        public func index(of element: Self.Generator.Element) -> Self.Index? {
            return self.indexOf(element)
        }
        
        public func split(separator separator: Self.Generator.Element, maxSplits: Int = Int.max, omittingEmptySubsequences: Bool = true) -> [Self.SubSequence] {
            return self.split(separator, maxSplit: maxSplits, allowEmptySlices: !omittingEmptySubsequences)
        }
    }
    
    extension UnsafeMutablePointer {
        var pointee: Memory {
            get {
                return self.memory
            }
            
            set {
                self.memory = newValue
            }
        }
        
        func deinitialize() {
            self.destroy()
        }
        
        func deallocateCapacity(i: Int) {
            self.dealloc(i)
        }
    }
    
    extension NSDate {
        @objc(kaas:) func isEqual(to otherDate: NSDate) -> Bool {
            return self.isEqualToDate(otherDate)
        }
    }
    
    extension String {
        public func index(startIndex: Index, offsetBy offset: Int) -> Index {
            return startIndex.advancedBy(offset)
        }
        
        public func replacingOccurrences(of lhs: String, with replacement: String) -> String {
            return self.stringByReplacingOccurrencesOfString(lhs, withString: replacement)
        }
    }
    
    extension Int {
        public func advanced(by i: Int) -> Int {
            return self.advancedBy(i)
        }
    }
    
    public func stride(from a: Int, to: Int, by: Int) -> StrideTo<Int> {
        return a.stride(to: to, by: by)
    }
    
    public func stride(from a: Int, through: Int, by: Int) -> StrideThrough<Int> {
        return a.stride(through: through, by: by)
    }
    
#endif
