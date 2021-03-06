//
// Created by Lucas Nelaupe on 25/9/17.
//

import Foundation

private final class LazyArrayCache<Element>: LazyArray<Element> {

    private let actual: LazyArray<Element>
    private var cache = [Int: Element]()

    public init(actual: LazyArray<Element>) {
        self.actual = actual
    }

    public override var count: Int {
        return actual.count
    }

    public override subscript(index: Int) -> Element {
        if let cached = cache[index] {
            return cached
        } else {
            let item = actual[index]
            cache[index] = item
            return item
        }
    }

}

extension LazyArray {

    public final func cache() -> LazyArray<Element> {
        return LazyArrayCache(actual: self)
    }

}
