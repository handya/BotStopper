//
//  BotDetectionKit+Request.swift
//  
//
//  Created by Andrew Farquharson on 28/04/21.
//

import Vapor

extension Request {
    public var botStopper: BS {
        .init(request: self)
    }

    public struct BS {
        let request: Request
    }
}

extension Request.BS {
    public func stop() throws {
        guard let userAgent = self.request.headers.userAgent else {
            throw BotStopperError.noUserAgent
        }
        try self.request.application.botStopper.stop(userAgent: userAgent)
    }
}

private extension HTTPHeaders {
    var userAgent: String? {
        return first(name: .init("User-Agent"))
    }
}
