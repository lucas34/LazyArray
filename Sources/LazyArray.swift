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

    public final func toArray() -> [Element] {
        return toArray(max: count)
    }

    public final func isEmpty() -> Bool {
        return count < 1
    }

    public final func hasData() -> Bool {
        return !isEmpty()
    }

    public final func cache() -> LazyArray<Element> {
        return LazyArrayCache(data: self)
    }

    public final func toArray(max: Int) -> [Element] {
        if max < 0 {
            return []
        } else {
            var result = [Element]()
            for i in 0..<min(max, count) {
                result.append(self[i])
            }
            return result
        }
    }

    public subscript(subRange: Range<Int>) -> LazyArray<Element> {
        return LazyArrayWithFixSize(data: self, interval: subRange)
    }

    public final func lazyMap<T>(_ transform: @escaping (Element) -> T) -> LazyArray<T> {
        return LazyArrayMap(data: self, map: transform)
    }

    public final func asAny() -> LazyArray<Any> {
        return AnyLazyArray(data: self)
    }

    public var count: Int {
        get {
            return 0
        }
    }

    public subscript(index: Int) -> Element {
        get {
            let empty = [Element]()
            return empty[index]
        }
    }
}
