//
//  LazyMutableList.swift
//  LazySwift
//
//  Created by Lucas Nelaupe on 18/9/17.
//
//

import Foundation

// Experimental
public final class LazyMutableList<Element> : LazyArray<Element> {

    private var actual = [LazyArray<Element>]()
    private var total = 0

    public func append(_ item: LazyArray<Element>) {
        actual.append(item)
        total += item.count
    }

    public override var count: Int {
        return total
    }

    public override subscript(index: Int) -> Element {
        var offset = 0
        var current = 0

        while offset + actual[current].count <= index {
            offset += actual[current].count
            current += 1
        }
        return actual[current][index - offset]
    }
}
