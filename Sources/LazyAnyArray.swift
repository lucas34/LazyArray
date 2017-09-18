//
//  LazyAnyArray.swift
//  LazySwift
//
//  Created by Lucas Nelaupe on 18/9/17.
//
//

import Foundation

internal final class AnyLazyArray<Element>: LazyArray<Any> {
    
    private let actual: LazyArray<Element>
    
    public init(data: LazyArray<Element>) {
        self.actual = data
    }
    
    public override var count: Int {
        get {
            return actual.count
        }
    }
    
    public override subscript(index: Int) -> Any {
        get {
            return actual[index]
        }
    }
}
