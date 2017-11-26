//
//  LazyArray.swift
//  LazySwift
//
//  Created by Lucas Nelaupe on 18/9/17.
//
//

import Foundation

public protocol LazyArrayStruct {

    associatedtype LazyElement

    var count: Int { get }

    subscript(index: Int) -> LazyElement { get }
}

extension LazyArrayStruct {

    func wrap() -> LazyArray<Self.LazyElement> {
        return LazyArray<Self.LazyElement>(count: self.count) { (i: Int) -> Self.LazyElement in
            return self[i]
        }
    }

}

public class LazyArray<Element> {

    let actualCount: Int
    let actual: (Int) -> Element

    public init(count: Int, callback: @escaping (Int) -> Element) {
        self.actualCount = count
        self.actual = callback
    }

    open var count: Int {
        return actualCount
    }

    open subscript(index: Int) -> Element {
        return actual(index)
    }

}
