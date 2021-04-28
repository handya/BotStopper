//
//  BotDetectionConfiguration.swift
//  
//
//  Created by Andrew Farquharson on 28/04/21.
//

import Vapor

public struct BotStopperConfiguration {
    let botList: [Bot]
    let defaultError: Error

    public init(path: String, fileName: String = "Robots_list.json", defaultError: Error = Abort(.botDetected)) throws {
        let robotsList = try String(contentsOfFile: path + fileName)
        guard let jsonData = robotsList.data(using: .utf8) else {
            throw BotStopperError.failedToLoadList
        }
        self.botList = try JSONDecoder().decode([Bot].self, from: jsonData)
        self.defaultError = defaultError
    }

    public init(bots: [Bot], defaultError: Error = Abort(.botDetected)) {
        self.botList = bots
        self.defaultError = defaultError
    }
}
