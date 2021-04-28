//
//  BotDetectionKitError.swift
//  
//
//  Created by Andrew Farquharson on 28/04/21.
//

import Vapor

enum BotStopperError: Error {
    case failedToLoadList
    case notConfigured
    case noUserAgent
}

extension HTTPResponseStatus {
    static let botDetected: HTTPResponseStatus = .custom(code: 405, reasonPhrase: "Bots not allowed 🤖")
}
