//
//  Bot.swift
//  
//
//  Created by Andrew Farquharson on 28/04/21.
//

import Foundation

public struct Bot: Decodable {
    let pattern: String
    let lastChanged: String

    public init(pattern: String, lastChanged: String = "") {
        self.pattern = pattern
        self.lastChanged = lastChanged
    }

    enum CodingKeys: String, CodingKey {
        case pattern
        case lastChanged = "last_changed"
    }
}
