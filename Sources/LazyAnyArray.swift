//
//  LazyAnyArray.swift
//  LazySwift
//
//  Created by Lucas Nelaupe on 18/9/17.
//
//

import Foundation

private final class AnyLazyArray<Element>: LazyArray<Any> {

    private let actual: LazyArray<Element>

    public init(data: LazyArray<Element>) {
        self.actual = data
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
        return AnyLazyArray(data: self)
    }

}
