//
//  Theme.swift
//  Memorize
//
//  Created by Scott on 01/01/2022.
//

import Foundation

struct Theme<CardContent> {
    var name: String
    var emojis: [CardContent]
    var numberOfCards: Int
    var color: String
}
