//
//  LazyArrayWrapper.swift
//  LazySwift
//
//  Created by Lucas Nelaupe on 18/9/17.
//
//

import Foundation

private class LazyArrayWrapper<Element>: LazyArray<Element> {

    private let actual: [Element]

    public init(data: [Element]) {
        self.actual = data
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
        return LazyArrayWrapper(data: self)
    }

}
