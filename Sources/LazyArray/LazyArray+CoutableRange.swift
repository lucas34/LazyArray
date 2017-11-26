//
// Created by Lucas Nelaupe on 25/09/2017.
//

import Foundation

public struct LazyArrayWithClosedRange<Actual: LazyArrayStruct>: LazyArrayStruct {

    public typealias LazyElement = Actual.LazyElement

    private let actual: Actual
    private let actualInterval: CountableClosedRange<Int>

    public init(actual: Actual, range: CountableClosedRange<Int>) {
        self.actual = actual
        self.actualInterval = range
    }

    public var count: Int {
        return actualInterval.lowerBound.distance(to: actualInterval.upperBound) + 1
    }

    public subscript(index: Int) -> LazyElement {
        if index < 0 || index > actualInterval.upperBound {
            fatalError("Index out of range")
        }
        return actual[actualInterval.lowerBound + index]
    }
}

extension LazyArrayStruct {

    public subscript(subRange: CountableClosedRange<Int>) -> LazyArrayWithClosedRange<Self> {
        guard subRange.lowerBound >= 0 else {
            fatalError("Negative Array index is out of range")
        }

        guard subRange.lowerBound <= count && subRange.upperBound < count else {
            fatalError("Array index is out of range")
        }

        return LazyArrayWithClosedRange(actual: self, range: subRange)
    }

}
