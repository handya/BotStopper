//
//  BotStopper.swift
//  
//
//  Created by Andrew Farquharson on 28/04/21.
//

import Vapor

public class BotStopper {
    static func stop(using config: BotStopperConfiguration, userAgent: String) throws {
        try config.botList.forEach { bot in
            if userAgent.range(of: bot.pattern, options: .regularExpression) != nil {
                throw Abort(.botDetected)
            }
        }
    }
}
