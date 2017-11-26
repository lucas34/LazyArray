//
// Created by Lucas Nelaupe on 25/9/17.
//

import Foundation

public struct LazyArrayCache<Actual: LazyArrayStruct>: LazyArrayStruct {

    public typealias LazyElement = Actual.LazyElement

    private let actual: Actual
    private var cache = [Int: LazyElement]()

    public init(actual: Actual) {
        self.actual = actual
    }

    public var count: Int {
        return actual.count
    }

    public subscript(index: Int) -> LazyElement {
        if let cached = cache[index] {
            return cached
        } else {
            let item = actual[index]
//            cache[index] = item
            return item
        }
    }

}

public extension LazyArrayStruct {

    public func cache() -> LazyArrayCache<Self> {
        return LazyArrayCache(actual: self)
    }

}
