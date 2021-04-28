//
//  Bot.swift
//  
//
//  Created by Andrew Farquharson on 28/04/21.
//

import Foundation

struct Bot: Decodable {
    let pattern: String
    let lastChanged: String

    enum CodingKeys: String, CodingKey {
        case pattern
        case lastChanged = "last_changed"
    }
}
