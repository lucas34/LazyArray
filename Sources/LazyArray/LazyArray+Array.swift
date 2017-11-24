//
// Created by Lucas Nelaupe on 25/9/17.
//

import Foundation

private class LazyArrayWithArray<Element>: LazyArray<Element> {

    private let actual: [Element]

    public init(actual: [Element]) {
        self.actual = actual
    }

    public override var count: Int {
        return actual.count
    }

    public override subscript(index: Int) -> Element {
        return actual[index]
    }

}

extension Array {

    public var lazyArray: LazyArray<Element> {
        return LazyArrayWithArray(actual: self)
    }

}
