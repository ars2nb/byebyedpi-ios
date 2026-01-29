import XCTest
@testable import ByeByeDPI

final class CommandSelectorTests: XCTestCase {
    func testBuildsProfileWithSteps() {
        let selector = CommandSelector()
        let profile = selector.makeProfile(for: .balanced, routePolicy: .splitTunnel)

        XCTAssertEqual(profile.strategy, .balanced)
        XCTAssertFalse(profile.commandPlan.steps.isEmpty)
        XCTAssertTrue(profile.commandPlan.steps.first?.arguments.contains("--route") ?? false)
    }
}
