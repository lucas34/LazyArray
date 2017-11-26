//
// Created by Lucas Nelaupe on 23/11/17.
//

import Foundation

public struct LazyArrayReversed<Actual: LazyArrayStruct>: LazyArrayStruct {

    public typealias LazyElement = Actual.LazyElement

    private let actual: Actual

    public init(actual: Actual) {
        self.actual = actual
    }

    public var count: Int {
        return actual.count
    }

    public subscript(index: Int) -> LazyElement {
        return actual[count - 1 - index]
    }

}

public extension LazyArrayStruct {

    public func reversed() -> LazyArrayReversed<Self> {
        return LazyArrayReversed(actual: self)
    }

}
