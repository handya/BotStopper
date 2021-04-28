//
//  BotDetectionConfiguration.swift
//  
//
//  Created by Andrew Farquharson on 28/04/21.
//

import Foundation

public struct BotStopperConfiguration {
    let botList: [Bot]

    public init(path: String, fileName: String = "Robots_list.json") throws {
        let robotsList = try String(contentsOfFile: path + fileName)
        guard let jsonData = robotsList.data(using: .utf8) else {
            throw BotStopperError.failedToLoadList
        }
        self.botList = try JSONDecoder().decode([Bot].self, from: jsonData)
    }
}
