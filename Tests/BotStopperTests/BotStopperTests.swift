import XCTest
import BotStopper
import XCTVapor

final class BotStopperTests: XCTestCase {
    let bots: [Bot] = [
        .init(pattern: "bot")
    ]

    let botAgent: String = "Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.130 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"

    let userAgent: String = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15"

    func testBotStopper() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        app.botStopper.configuration = BotStopperConfiguration(bots: bots)

        XCTAssertThrowsError(try app.botStopper.stop(userAgent: botAgent))

        XCTAssertNoThrow(try app.botStopper.stop(userAgent: userAgent))
    }

    static var allTests = [
        ("testBotStopper", testBotStopper),
    ]
}
