//
// Created by Lucas Nelaupe on 25/9/17.
//

import Foundation

public struct LazyArrayStructArray<Element>: LazyArrayStruct {

    typealias LazyData = Element

    private let actual: [Element]

    public init(actual: [Element]) {
        self.actual = actual
    }

    public var count: Int {
        return actual.count
    }

    public subscript(index: Int) -> Element {
        return actual[index]
    }

}

extension Array {

    public var lazyArray: LazyArrayStructArray<Element> {
        return LazyArrayStructArray(actual: self)
    }

}
