//
// Created by Lucas Nelaupe on 25/9/17.
//

import Foundation

// Linear operations to leave LazyWorld
extension LazyArrayStruct {

    internal func forEach(_ callback: (LazyElement) -> Void) {
        for i in 0..<count {
            callback(self[i])
        }
    }

    public func toArray() -> [LazyElement] {
        var result = [LazyElement]()
        result.reserveCapacity(count)
        forEach { result.append($0) }
        return result
    }

    public func reduce<Result>(_ accumulator: Result, _ next: (Result, LazyElement) -> Result) -> Result {
        var total = accumulator
        for i in 0..<count {
            total = next(total, self[i])
        }
        return total
    }

}

extension LazyArrayStruct where LazyElement : Hashable {

    public func toSet() -> Set<LazyElement> {
        var result = Set<LazyElement>(minimumCapacity: count)
        forEach { result.insert($0) }
        return result
    }

}
