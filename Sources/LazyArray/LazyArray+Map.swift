//
// Created by Lucas Nelaupe on 25/9/17.
//

import Foundation

private final class LazyArrayMap<Element, Transformed>: LazyArray<Transformed> {

    private let actual: LazyArray<Element>
    private let transformation: (Element) -> Transformed

    public init(actual: LazyArray<Element>, map: @escaping (Element) -> Transformed) {
        self.actual = actual
        self.transformation = map
    }

    public override var count: Int {
        return actual.count
    }

    public override subscript(index: Int) -> Transformed {
        return transformation(actual[index])
    }

}

extension LazyArray {

    public final func map<T>(_ transform: @escaping (Element) -> T) -> LazyArray<T> {
        return LazyArrayMap(actual: self, map: transform)
    }

}
