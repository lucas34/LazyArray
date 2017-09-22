import XCTest
@testable import LazyArray

class LazyArrayTests: XCTestCase {

    public func testEmptyLazyArray() {
        let empty: LazyArray<Int> = LazyArray<Int>.EMPTY()
        XCTAssertTrue(empty.isEmpty())
        XCTAssertFalse(empty.hasData())
    }

    public func testLazyMutableList() {
        let list = LazyMutableList<Int>()

        list.append([0, 1, 2].lazyArray)
        XCTAssertEqual(3, list.count)
        XCTAssertEqual(0, list[0])
        XCTAssertEqual(1, list[1])
        XCTAssertEqual(2, list[2])

        list.append([3].lazyArray)
        XCTAssertEqual(4, list.count)
        XCTAssertEqual(3, list[3])

        list.append([].lazyArray)
        XCTAssertEqual(4, list.count)

        list.append([5].lazyArray)
        XCTAssertEqual(5, list.count)
        XCTAssertEqual(5, list[4])
    }

    public func testLazyMap() {
        let array = [1, 2, 3].lazyArray.map { $0 * 2 }
        XCTAssertEqual(3, array.count)
        XCTAssertEqual(2, array[0])
        XCTAssertEqual(4, array[1])
        XCTAssertEqual(6, array[2])
    }

    public func testLazyCache() {
        var item = 1
        let array = [item, 2].lazyArray.cache()

        XCTAssertEqual(2, array.count)
        XCTAssertEqual(1, array[0])
        XCTAssertEqual(2, array[1])

        item = 10
        // No change
        // Coverage will also cover
        XCTAssertEqual(1, array[0])
    }

    public func testAnyLazyArray() {
        let anyArray = [1, 2].lazyArray.asAny()
        XCTAssertEqual(2, anyArray.count)
        XCTAssertEqual(1, anyArray[0] as? Int)
        XCTAssertEqual(2, anyArray[1] as? Int)
    }

    public func testToArray() {
        XCTAssertEqual([1, 2, 3], [1, 2, 3].lazyArray.toArray())
        XCTAssertEqual([1, 2], [1, 2, 3].lazyArray.toArray(max: 2))
    }

    public func testSubArray() {
        let base = [1, 2, 3]
        XCTAssertEqual(Array(base[1..<2]), base.lazyArray[1..<2].toArray())
    }

    public func testExtension() {
        XCTAssertEqual([1, 2].first, [1, 2].lazyArray.first)
        XCTAssertNil([].lazyArray.first)

        XCTAssertEqual([1, 2].last, [1, 2].lazyArray.last)
        XCTAssertNil([].lazyArray.last)

        // Drop first

        XCTAssertEqual(Array([1, 2, 3].dropFirst()), [1, 2, 3].lazyArray.dropFirst().toArray())
        XCTAssertEqual(Array([1, 2, 3].dropFirst(0)), [1, 2, 3].lazyArray.dropFirst(0).toArray())
        XCTAssertEqual(Array([1, 2, 3].dropFirst(1)), [1, 2, 3].lazyArray.dropFirst(1).toArray())

        // Drop Last

        XCTAssertEqual(Array([1, 2, 3].dropLast()), [1, 2, 3].lazyArray.dropLast().toArray())
        XCTAssertEqual(Array([1, 2, 3].dropLast(0)), [1, 2, 3].lazyArray.dropLast(0).toArray())
        XCTAssertEqual(Array([1, 2, 3].dropLast(1)), [1, 2, 3].lazyArray.dropLast(1).toArray())

        XCTAssertEqual(Array([1, 2, 3].prefix(0)), [1, 2, 3].lazyArray.prefix(0).toArray())
        XCTAssertEqual(Array([1, 2, 3].prefix(1)), [1, 2, 3].lazyArray.prefix(1).toArray())

        XCTAssertEqual(Array([1, 2, 3].suffix(0)), [1, 2, 3].lazyArray.suffix(0).toArray())
        XCTAssertEqual(Array([1, 2, 3].suffix(1)), [1, 2, 3].lazyArray.suffix(1).toArray())
    }

}
