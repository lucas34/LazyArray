//
// Created by Lucas Nelaupe on 25/9/17.
//

import Foundation

private final class LazyArrayWithRange<Element>: LazyArray<Element> {

    private let actual: LazyArray<Element>
    private let actualInterval: Range<Int>

    public init(data: LazyArray<Element>, range: Range<Int>) {
        self.actual = data
        self.actualInterval = range
    }

    public override var count: Int {
        return actualInterval.lowerBound.distance(to: actualInterval.upperBound)
    }

    public override subscript(index: Int) -> Element {
        if index < 0 || index > actualInterval.upperBound {
            fatalError("Index out of range")
        }
        return actual[actualInterval.lowerBound + index]
    }
}

extension LazyArray {

    public final subscript(subRange: Range<Int>) -> LazyArray<Element> {
        guard subRange.lowerBound >= 0 else {
            fatalError("Negative Array index is out of range")
        }

        guard subRange.lowerBound <= count && subRange.upperBound <= count else {
            fatalError("Array index is out of range")
        }

        return LazyArrayWithRange(data: self, range: subRange)
    }

}
