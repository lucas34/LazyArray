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
        let empty = [Element]()
        return empty[index]
    }
}
