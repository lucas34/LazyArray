//
//  LazyArrayWrapper.swift
//  LazySwift
//
//  Created by Lucas Nelaupe on 18/9/17.
//
//

import Foundation

public class LazyArrayWrapper<Element>: LazyArray<Element> {
    
    private let actual: [Element]
    
    public init(data: [Element]) {
        self.actual = data
    }
    
    public override var count: Int {
        get {
            return actual.count
        }
    }
    
    public override subscript(index: Int) -> Element {
        get {
            return actual[index]
        }
    }
    
}
