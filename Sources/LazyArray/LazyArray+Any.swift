//
// Created by Lucas Nelaupe on 25/9/17.
//

import Foundation

private final class LazyArrayAny<Element>: LazyArray<Any> {

    private let actual: LazyArray<Element>

    public init(actual: LazyArray<Element>) {
        self.actual = actual
    }

    public override var count: Int {
        return actual.count
    }

    public override subscript(index: Int) -> Any {
        return actual[index]
    }

}

extension LazyArray {

    public final func asAny() -> LazyArray<Any> {
        return LazyArrayAny(actual: self)
    }

}
