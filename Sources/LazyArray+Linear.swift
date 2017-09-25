//
// Created by Lucas Nelaupe on 25/9/17.
//

import Foundation

// Linear operations to leave LazyWorld
extension LazyArray {

    internal func forEach(_ callback: (Element) -> Void) {
        for i in 0..<count {
            callback(self[i])
        }
    }

    public final func toArray() -> [Element] {
        var result = [Element]()
        result.reserveCapacity(count)
        forEach { result.append($0) }
        return result
    }

    public final func reduce<Result>(_ accumulator: Result, _ next: (Result, Element) -> Result) -> Result {
        var total = accumulator
        for i in 0..<count {
            total = next(total, self[i])
        }
        return total
    }

}

extension LazyArray where Element : Hashable {

    public final func toSet() -> Set<Element> {
        var result = Set<Element>(minimumCapacity: count)
        forEach { result.insert($0) }
        return result
    }

}
