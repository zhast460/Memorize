//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Junkang Zhang on 22/08/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚒", "✈️", "🚐", "🚝", "🚤", "🚇","🛸","🛶"];
    
    static func createMemoryGame () -> MemoryGame<String> {
        MemoryGame<String>(numbersOfPairsOfCards: 3, createCardContent: {idx in emojis[idx]})
    }
    
    @Published private var model: MemoryGame = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // Mark: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
