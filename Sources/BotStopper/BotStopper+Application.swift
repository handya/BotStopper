//
//  BotDetectionKit+Application.swift
//  
//
//  Created by Andrew Farquharson on 28/04/21.
//

import Vapor

extension Application {
    public var botStopper: BS {
        .init(application: self)
    }

    public struct BS {
        struct ConfigurationKey: StorageKey {
            typealias Value = BotStopperConfiguration
        }

        public var configuration:BotStopperConfiguration? {
            get {
                self.application.storage[ConfigurationKey.self]
            }
            nonmutating set {
                self.application.storage[ConfigurationKey.self] = newValue
            }
        }

        let application: Application
    }
}

extension Application.BS {
    public func stop(userAgent: String) throws {
        guard let config = self.application.botStopper.configuration else {
            throw BotStopperError.notConfigured
        }
        try BotStopper.stop(using: config, userAgent: userAgent)
    }
}
