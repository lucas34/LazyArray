////
//// Created by Lucas Nelaupe on 25/9/17.
////
//
//import Foundation
//
//private final class AnyLazyArray<Element>: LazyArray<Any> {
//
//    private let actual: LazyArray<Element>
//
//    public init(data: LazyArray<Element>) {
//        self.actual = data
//    }
//
//    public override var count: Int {
//        return actual.count
//    }
//
//    public override subscript(index: Int) -> Any {
//        return actual[index]
//    }
//
//}
//
//extension LazyArray {
//
//    public final func asAny() -> LazyArray<Any> {
//        return AnyLazyArray(data: self)
//    }
//
//}
//
//
//
//
//
//public struct LazyArrayMapStruct<Actual: LazyArrayStruct, Transformed>: LazyArrayStruct {
//
//    public typealias LazyElement = Transformed
//
//    private let actual: Actual
//    private let transformation: (Actual.LazyElement) -> Transformed
//
//    public init(actual: Actual, map: @escaping (Actual.LazyElement) -> Transformed) {
//        self.actual = actual
//        self.transformation = map
//    }
//
//    public var count: Int {
//        return actual.count
//    }
//
//    public subscript(index: Int) -> Transformed {
//        return transformation(actual[index])
//    }
//
//}
//
//extension LazyArrayStruct {
//
//    public final func asAny() -> LazyArray<Any> {
//        return AnyLazyArray(data: self)
//    }
//
//    public func map<T>(_ transform: @escaping (LazyElement) -> T) -> LazyArrayMapStruct<Self, T> {
//        return LazyArrayMapStruct(actual: self, map: transform)
//    }
//
//}
//
