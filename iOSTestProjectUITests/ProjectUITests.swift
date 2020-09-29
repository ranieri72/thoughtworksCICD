import XCTest

class ProjectUITests: XCTestCase {
    func testThatFails() {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(false, "This should fail")
    }
}
