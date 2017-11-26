//
// Created by Lucas Nelaupe on 25/9/17.
//

import Foundation

public struct LazyArrayMapStruct<Actual: LazyArrayStruct, Transformed>: LazyArrayStruct {

    public typealias LazyElement = Transformed

    private let actual: Actual
    private let transformation: (Actual.LazyElement) -> Transformed

    public init(actual: Actual, map: @escaping (Actual.LazyElement) -> Transformed) {
        self.actual = actual
        self.transformation = map
    }

    public var count: Int {
        return actual.count
    }

    public subscript(index: Int) -> Transformed {
        return transformation(actual[index])
    }

}

extension LazyArrayStruct {

    public func map<T>(_ transform: @escaping (LazyElement) -> T) -> LazyArrayMapStruct<Self, T> {
        return LazyArrayMapStruct(actual: self, map: transform)
    }

}
