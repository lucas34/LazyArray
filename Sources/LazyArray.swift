//
//  LazyArray.swift
//  LazySwift
//
//  Created by Lucas Nelaupe on 18/9/17.
//
//

import Foundation

open class LazyArray<Element> {

    public init() {}

    open var count: Int {
        return 0
    }

    open subscript(index: Int) -> Element {
        fatalError("fatal error: Index out of range")
    }
}
