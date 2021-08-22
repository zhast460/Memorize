//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Junkang Zhang on 22/08/2021.
//

import SwiftUI

class EmojiMemoryGame {
    
    static let emojis = ["🚒", "✈️", "🚐", "🚝", "🚤", "🚇","🛸","🛶"];
    
    static func createMemoryGame () -> MemoryGame<String> {
        MemoryGame<String>(numbersOfPairsOfCards: 4, createCardContent: {idx in emojis[idx]})
    }
    
    private var model: MemoryGame = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
}
