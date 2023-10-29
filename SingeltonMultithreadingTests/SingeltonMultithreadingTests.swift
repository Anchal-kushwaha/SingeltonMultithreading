import XCTest
@testable import SingeltonMultithreading

class SingeltonMultithreadingTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func testSingelton() {
        let concurrentQueue = DispatchQueue(label: "concurrent",
                                            attributes: .concurrent)
        concurrentQueue.async {
            _ = Singleton.getInstance()
        }
        concurrentQueue.async {
            _ = Singleton.getInstance()
        }
    }
}
