//
//  LazyArrayWithFixSize.swift
//  LazySwift
//
//  Created by Lucas Nelaupe on 18/9/17.
//
//

import Foundation

private final class LazyArrayWithFixSize<Element>: LazyArray<Element> {

    private let actual: LazyArray<Element>
    private let actualinterval: Range<Int>

    public init(data: LazyArray<Element>, interval: Range<Int>) {
        self.actual = data
        self.actualinterval = interval
    }

    public override var count: Int {
        return actualinterval.upperBound - actualinterval.lowerBound
    }

    public override subscript(index: Int) -> Element {
        if index > actualinterval.upperBound {
            let empty: [Element] = []
            return empty[index] // To simulate the index out of bound
        }
        return actual[actualinterval.lowerBound + index]
    }
}

extension LazyArray {

    public final subscript(subRange: Range<Int>) -> LazyArray<Element> {
        return LazyArrayWithFixSize(data: self, interval: subRange)
    }

}
