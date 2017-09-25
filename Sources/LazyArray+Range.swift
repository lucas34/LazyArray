//
// Created by Lucas Nelaupe on 25/9/17.
//

import Foundation

private final class LazyArrayWithRange<Element>: LazyArray<Element> {

    private let actual: LazyArray<Element>
    private let actualInterval: Range<Int>

    public init(data: LazyArray<Element>, interval: Range<Int>) {
        self.actual = data
        self.actualInterval = interval
    }

    public override var count: Int {
        return actualInterval.upperBound - actualInterval.lowerBound
    }

    public override subscript(index: Int) -> Element {
        if index > actualInterval.upperBound {
            fatalError("fatal error: Index out of range")
        }
        return actual[actualInterval.lowerBound + index]
    }
}

extension LazyArray {

    public final subscript(subRange: Range<Int>) -> LazyArray<Element> {
        let lower = Swift.min(count, Swift.max(0, subRange.lowerBound))
        let high = Swift.min(count, subRange.upperBound)
        guard high > 0 else {
            return LazyArray<Element>.EMPTY()
        }
        return LazyArrayWithRange(data: self, interval: lower..<high)
    }

    public final subscript(subRange: CountableClosedRange<Int>) -> LazyArray<Element> {
        let lower = Swift.min(count, Swift.max(0, subRange.lowerBound))
        let high = Swift.min(count, subRange.upperBound) + 1
        return LazyArrayWithRange(data: self, interval: lower..<high)
    }

}
