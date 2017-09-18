//
//  LazyMutableList.swift
//  LazySwift
//
//  Created by Lucas Nelaupe on 18/9/17.
//
//

import Foundation

internal class LazyMutableList<Element> : LazyArray<Element> {
    
    private var actual = [LazyArray<Element>]()
    private var total = 0
    
    func append(_ item: LazyArray<Element>) {
        actual.append(item)
        total += item.count
    }
    
    override subscript(subRange: Range<Int>) -> LazyArray<Element> {
        return super[subRange]
    }
    
    override var count: Int {
        return total
    }
    override subscript(index: Int) -> Element {
        var offset = 0
        var current = 0
        
        while offset + actual[current].count <= index {
            offset += actual[current].count
            current += 1
        }
        return actual[current][index - offset]
    }
}
