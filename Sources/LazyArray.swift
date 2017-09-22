//
//  LazyArray.swift
//  LazySwift
//
//  Created by Lucas Nelaupe on 18/9/17.
//
//

import Foundation

public class LazyArray<Element> {

    public var count: Int {
        return 0
    }

    public subscript(index: Int) -> Element {
        fatalError("fatal error: Index out of range")
    }
}

public extension LazyArray {

    public static func EMPTY<E>() -> LazyArray<E> {
        return LazyArray<E>()
    }

    public final var isEmpty: Bool {
        return count < 1
    }

    public final var hasData: Bool {
        return !isEmpty
    }

    public final var first: Element? {
        return isEmpty ? nil : self[0]
    }

    public final var last: Element? {
        return isEmpty ? nil : self[count - 1]
    }

    public final func dropFirst() -> LazyArray<Element> {
        return self[1..<count]
    }

    public final func dropFirst(_ n: Int) -> LazyArray<Element> {
        guard n >= 0 else {
            fatalError("fatal error: Can't drop a negative number of elements from a collection")
        }
        return self[n...count]
    }

    public final func dropLast() -> LazyArray<Element> {
        return self[0..<Swift.max(0, (count - 1))]
    }

    public final func dropLast(_ n: Int) -> LazyArray<Element> {
        guard n >= 0 else {
            fatalError("fatal error: Can't drop a negative number of elements from a collection")
        }
        return self[0..<Swift.max(0, (count - n))]
    }

    public final func prefix(_ maxLength: Int) -> LazyArray<Element> {
        guard maxLength >= 0 else {
            fatalError("fatal error: Can't take a prefix of negative length from a collection")
        }
        return self[0..<maxLength]
    }

    public final func suffix(_ maxLength: Int) -> LazyArray<Element> {
        guard maxLength >= 0 else {
            fatalError("fatal error: Can't take a suffix of negative length from a collection")
        }
        return self[Swift.min(count, Swift.max(0, count - maxLength))..<count]
    }

    public final func reduce<Result>(_ accumulator: Result, _ next: (Result, Element) -> Result) -> Result {
        var total = accumulator
        for i in 0..<count {
            total = next(total, self[i])
        }
        return total
    }
}
