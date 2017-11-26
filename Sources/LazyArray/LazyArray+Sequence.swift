//
// Created by Lucas Nelaupe on 25/9/17.
//

import Foundation

// Methods inspired by Sequence protocol
public extension LazyArrayStruct {

//    public static func EMPTY() -> Self {
//        return LazyArrayEmpty()
//    }

    public var isEmpty: Bool {
        return count < 1
    }

    public var hasData: Bool {
        return !isEmpty
    }

    public var first: LazyElement? {
        return isEmpty ? nil : self[0]
    }

    public var last: LazyElement? {
        return isEmpty ? nil : self[count - 1]
    }

    public func dropFirst() -> LazyArrayWithRange<Self> {
        guard count > 0 else {
            fatalError("")
        }
        return self[1..<count]
    }

    public func dropFirst(_ n: Int) -> LazyArrayWithRange<Self> {
        guard n >= 0 else {
            fatalError("Can't drop a negative number of LazyElements from a collection")
        }
        return self[Swift.min(count, n)..<count]
    }

    public func dropLast() -> LazyArrayWithRange<Self> {
        return self[0..<Swift.max(0, (count - 1))]
    }

    public func dropLast(_ n: Int) -> LazyArrayWithRange<Self> {
        guard n >= 0 else {
            fatalError("Can't drop a negative number of LazyElements from a collection")
        }
        return self[0..<Swift.max(0, (count - n))]
    }

    public func prefix(_ maxLength: Int) -> LazyArrayWithRange<Self> {
        guard maxLength >= 0 else {
            fatalError("Can't take a prefix of negative length from a collection")
        }
        return self[0..<Swift.min(count, maxLength)]
    }

//    public func suffix(_ maxLength: Int) -> LazyArrayWithRange<Self> {
//        guard maxLength >= 0 else {
//            fatalError("Can't take a suffix of negative length from a collection")
//        }
//        guard count - maxLength < count else {
//            return LazyArray<LazyElement>.EMPTY()
//        }
//        return self[Swift.min(count, Swift.max(0, count - maxLength))..<count]
//    }
}
