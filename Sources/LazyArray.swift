//
//  LazyArray.swift
//  LazySwift
//
//  Created by Lucas Nelaupe on 18/9/17.
//
//

import Foundation

public class LazyArray<Element> {

    public static func EMPTY<E>() -> LazyArray<E> {
        return LazyArray<E>()
    }

    public final func isEmpty() -> Bool {
        return count < 1
    }

    public final func hasData() -> Bool {
        return !isEmpty()
    }

    public final func toArray() -> [Element] {
        return toArray(max: count)
    }

    public final func toArray(max: Int) -> [Element] {
        if isEmpty() {
            return []
        } else {
            var result = [Element]()
            for i in 0..<min(max, count) {
                result.append(self[i])
            }
            return result
        }
    }

    public var count: Int {
        return 0
    }

    public subscript(index: Int) -> Element {
         fatalError("fatal error: Index out of range")
    }
}

public extension LazyArray {
    
    public final var first: Element? {
        return isEmpty() ? nil : self[0]
    }

    public final var last: Element? {
        return isEmpty() ? nil : self[count - 1]
    }

    func dropFirst() -> LazyArray<Element> {
        return self[1..<count]
    }
    func dropFirst(_ n: Int) -> LazyArray<Element> {
        guard n >= 0 else {
            fatalError("fatal error: Can't drop a negative number of elements from a collection")
        }
        return self[n...count]
    }

    func dropLast() -> LazyArray<Element> {
        return self[0..<max(0, (count - 1))]
    }

    func dropLast(_ n: Int) -> LazyArray<Element> {
        guard n >= 0 else {
            fatalError("fatal error: Can't drop a negative number of elements from a collection")
        }
        return self[0..<max(0, (count - n))]
    }

    func prefix(_ maxLength: Int) -> LazyArray<Element> {
        guard maxLength >= 0 else {
            fatalError("fatal error: Can't take a prefix of negative length from a collection")
        }
        return self[0..<maxLength]
    }

    func suffix(_ maxLength: Int) -> LazyArray<Element> {
        guard maxLength >= 0 else {
            fatalError("fatal error: Can't take a suffix of negative length from a collection")
        }
        return self[min(count, max(0, count - maxLength))..<count]
    }
}
