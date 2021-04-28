//
//  Bot.swift
//  
//
//  Created by Andrew Farquharson on 28/04/21.
//

import Foundation

public struct Bot: Decodable {
    let pattern: String

    public init(pattern: String) {
        self.pattern = pattern
    }
}
