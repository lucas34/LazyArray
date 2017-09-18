import XCTest
@testable import LazyArray

class LazyArrayTests: XCTestCase {

    public func testLazyMutableList() {
        let list = LazyMutableList<Int>()
        
        list.append(LazyArrayWrapper(data: [0, 1, 2]))
        XCTAssertEqual(3, list.count)
        XCTAssertEqual(0, list[0])
        XCTAssertEqual(1, list[1])
        XCTAssertEqual(2, list[2])
        
        list.append(LazyArrayWrapper(data: [3]))
        XCTAssertEqual(4, list.count)
        XCTAssertEqual(3, list[3])
        
        list.append(LazyArrayWrapper(data: []))
        XCTAssertEqual(4, list.count)
        
        list.append(LazyArrayWrapper(data: [5]))
        XCTAssertEqual(5, list.count)
        XCTAssertEqual(5, list[4])
    }

}
