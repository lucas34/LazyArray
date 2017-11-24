//
// Created by Lucas Nelaupe on 25/09/2017.
//

import Foundation

private final class LazyArrayWithRange<Element>: LazyArray<Element> {

    private let actual: LazyArray<Element>
    private let actualInterval: CountableClosedRange<Int>

    public init(actual: LazyArray<Element>, range: CountableClosedRange<Int>) {
        self.actual = actual
        self.actualInterval = range
    }

    public override var count: Int {
        return actualInterval.lowerBound.distance(to: actualInterval.upperBound) + 1
    }

    public override subscript(index: Int) -> Element {
        if index < 0 || index > actualInterval.upperBound {
            fatalError("Index out of range")
        }
        return actual[actualInterval.lowerBound + index]
    }
}

extension LazyArray {

    public final subscript(subRange: CountableClosedRange<Int>) -> LazyArray<Element> {
        guard subRange.lowerBound >= 0 else {
            fatalError("Negative Array index is out of range")
        }

        guard subRange.lowerBound <= count && subRange.upperBound < count else {
            fatalError("Array index is out of range")
        }

        return LazyArrayWithRange(actual: self, range: subRange)
    }

}
