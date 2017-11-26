import XCTest
@testable import LazyArray

class LazyArrayTests: XCTestCase {

//    public func testLazyArrayAny() {
//        let anyArray = [1, 2].lazyArray.asAny()
//        XCTAssertEqual(2, anyArray.count)
//        XCTAssertEqual(1, anyArray[0] as? Int)
//        XCTAssertEqual(2, anyArray[1] as? Int)
//    }
//
    public func testLazyArrayArray() {
        let anyArray = [1, 2].lazyArray
        XCTAssertEqual(2, anyArray.count)
        XCTAssertEqual(1, anyArray[0])
        XCTAssertEqual(2, anyArray[1])
    }
//
//    public func testLazyArrayCache() {
//        var item = 1
//        let array = [item, 2].lazyArray.cache()
//
//        XCTAssertEqual(2, array.count)
//        XCTAssertEqual(1, array[0])
//        XCTAssertEqual(2, array[1])
//
//        item = 10
//        // No change
//        // Coverage will also cover
//        XCTAssertEqual(1, array[0])
//    }
//
    public func testLazyArrayLinear() {
        let empty: [Int] = [Int]()

        // To array

        XCTAssertEqual(empty, empty.lazyArray.toArray())
        XCTAssertEqual([1, 2], [1, 2].lazyArray.toArray())

        // To set
        XCTAssertEqual(Set(empty), empty.lazyArray.toSet())
        XCTAssertEqual(Set([1, 2]), [1, 2].lazyArray.toSet())

        // Reduce

        XCTAssertEqual([1, 2, 3].lazyArray.reduce(0, +), [1, 2, 3].reduce(0, +))
    }

    public func testLazyArrayMap() {
        let array = [1, 2, 3].lazyArray.map { $0 * 2 }
        XCTAssertEqual(3, array.count)
        XCTAssertEqual(2, array[0])
        XCTAssertEqual(4, array[1])
        XCTAssertEqual(6, array[2])
    }

    public func testLazyArrayRange() {
        let array = [1, 2, 3]

        XCTAssertEqual(Array(array[0..<0]), array.lazyArray[0..<0].toArray())
        XCTAssertEqual(Array(array[0..<1]), array.lazyArray[0..<1].toArray())
        XCTAssertEqual(Array(array[0..<2]), array.lazyArray[0..<2].toArray())
        XCTAssertEqual(Array(array[1..<1]), array.lazyArray[1..<1].toArray())
        XCTAssertEqual(Array(array[1..<2]), array.lazyArray[1..<2].toArray())

        XCTAssertEqual(Array(array[0...0]), array.lazyArray[0...0].toArray())
        XCTAssertEqual(Array(array[0...1]), array.lazyArray[0...1].toArray())
        XCTAssertEqual(Array(array[0...2]), array.lazyArray[0...2].toArray())
        XCTAssertEqual(Array(array[1...1]), array.lazyArray[1...1].toArray())
        XCTAssertEqual(Array(array[1...2]), array.lazyArray[1...2].toArray())

        let empty = [Int]()
        XCTAssertEqual(Array(empty[0..<0]), empty.lazyArray[0..<0].toArray())
    }

    public func testLazyArraySequence() {
        // Empty

        XCTAssertEqual([1].isEmpty, [1].lazyArray.isEmpty)
        XCTAssertEqual([].isEmpty, [].lazyArray.isEmpty)

        // Has data

        XCTAssertEqual(![1].isEmpty, [1].lazyArray.hasData)
        XCTAssertEqual(![].isEmpty, [].lazyArray.hasData)

        // First

        XCTAssertEqual([1, 2].first, [1, 2].lazyArray.first)
        XCTAssertNil([].lazyArray.first)

        // Last

        XCTAssertEqual([1, 2].last, [1, 2].lazyArray.last)
        XCTAssertNil([].lazyArray.last)

        // Drop first

        let empty = [Int]()

        XCTAssertEqual(Array([1, 2, 3].dropFirst()), [1, 2, 3].lazyArray.dropFirst().toArray())
        XCTAssertEqual(Array([1, 2, 3].dropFirst(0)), [1, 2, 3].lazyArray.dropFirst(0).toArray())
        XCTAssertEqual(Array([1, 2, 3].dropFirst(1)), [1, 2, 3].lazyArray.dropFirst(1).toArray())
        XCTAssertEqual(Array([1, 2, 3].dropFirst(9)), [1, 2, 3].lazyArray.dropFirst(9).toArray())
//        XCTAssertEqual(Array(empty.dropFirst()), empty.lazyArray.dropFirst().toArray())

        // Drop Last

        XCTAssertEqual(Array([1, 2, 3].dropLast()), [1, 2, 3].lazyArray.dropLast().toArray())
        XCTAssertEqual(Array([1, 2, 3].dropLast(0)), [1, 2, 3].lazyArray.dropLast(0).toArray())
        XCTAssertEqual(Array([1, 2, 3].dropLast(1)), [1, 2, 3].lazyArray.dropLast(1).toArray())
        XCTAssertEqual(Array([1, 2, 3].dropLast(9)), [1, 2, 3].lazyArray.dropLast(9).toArray())
//        XCTAssertEqual(Array(empty.dropLast()), empty.lazyArray.dropLast().toArray())

        // Prefix

        XCTAssertEqual(Array([1, 2, 3].prefix(0)), [1, 2, 3].lazyArray.prefix(0).toArray())
        XCTAssertEqual(Array([1, 2, 3].prefix(1)), [1, 2, 3].lazyArray.prefix(1).toArray())
        XCTAssertEqual(Array([1, 2, 3].prefix(9)), [1, 2, 3].lazyArray.prefix(9).toArray())
//        XCTAssertEqual(Array(empty.prefix(1)), empty.lazyArray.prefix(1).toArray())

        // Suffix

//        XCTAssertEqual(Array([1, 2, 3].suffix(0)), [1, 2, 3].lazyArray.suffix(0).toArray())
//        XCTAssertEqual(Array([1, 2, 3].suffix(1)), [1, 2, 3].lazyArray.suffix(1).toArray())
//        XCTAssertEqual(Array([1, 2, 3].suffix(9)), [1, 2, 3].lazyArray.suffix(9).toArray())
//        XCTAssertEqual(Array(empty.suffix(1)), empty.lazyArray.suffix(1).toArray())
//    }
//
//    public func testLazyMutableList() {
//        let list = [0, 1, 2].lazyArray.append(contentsOf: [3, 4, 5].lazyArray)
//        XCTAssertEqual([0, 1, 2, 3, 4, 5], list.toArray())
    }

    public func testReverseArray() {
        let empty: [Int] = [Int]()

        XCTAssertEqual(1, [1, 2, 3].lazyArray.reversed()[2])
        XCTAssertEqual(2, [1, 2, 3].lazyArray.reversed()[1])
        XCTAssertEqual(3, [1, 2, 3].lazyArray.reversed()[0])

        XCTAssertEqual([1, 2, 3].reversed(), [1, 2, 3].lazyArray.reversed().toArray())
        XCTAssertEqual(empty.reversed(), empty.lazyArray.reversed().toArray())
    }

}
