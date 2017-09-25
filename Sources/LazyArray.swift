//
//  LazyArray.swift
//  LazySwift
//
//  Created by Lucas Nelaupe on 18/9/17.
//
//

import Foundation

public class LazyArray<Element> {

    public var count: Int {
        return 0
    }

    public subscript(index: Int) -> Element {
        fatalError("fatal error: Index out of range")
    }
}
