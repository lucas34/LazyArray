//
// Created by Lucas Nelaupe on 23/11/17.
//

import Foundation

private final class LazyArrayReverse<Element>: LazyArray<Element> {

    private let actual: LazyArray<Element>

    public init(actual: LazyArray<Element>) {
        self.actual = actual
    }

    public override var count: Int {
        return actual.count
    }

    public override subscript(index: Int) -> Element {
        return actual[count - 1 - index]
    }

}

extension LazyArray {

    public final func reversed() -> LazyArray<Element> {
        return LazyArrayReverse(actual: self)
    }

}
