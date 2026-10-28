import XCTest

final class MirenvaUITests: XCTestCase {
    private let bundleIdentifier = "ETH.Mirenva.Mirenva"

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testAppLaunchesAndReachesRootScreen() {
        let app = XCUIApplication(bundleIdentifier: bundleIdentifier)
        app.launchArguments = ["--reset-family-store"]
        app.launch()

        XCTAssertTrue(app.otherElements["mirenva.root"].waitForExistence(timeout: 5))
        XCTAssertTrue(app.navigationBars["Mirenva"].exists)
    }

    @MainActor
    func testSampleFamilyPersistsAcrossLaunches() {
        let app = XCUIApplication(bundleIdentifier: bundleIdentifier)
        app.launchArguments = ["--reset-family-store", "--load-sample-family"]
        app.launch()
        XCTAssertTrue(app.staticTexts["The Bell Family"].waitForExistence(timeout: 5))

        app.terminate()
        app.launchArguments = []
        app.launch()

        XCTAssertTrue(app.staticTexts["The Bell Family"].waitForExistence(timeout: 5))
        XCTAssertTrue(app.staticTexts["2 members"].exists)
    }

    @MainActor
    func testGovernedExecutionRejectsEmptyAction() {
        let app = XCUIApplication(bundleIdentifier: bundleIdentifier)
        app.launchArguments = ["--evaluate-action", "   "]
        app.launch()

        XCTAssertTrue(app.staticTexts["An action is required."].waitForExistence(timeout: 5))
    }
}
