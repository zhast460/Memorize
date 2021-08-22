//
//  MemoryGame.swift
//  Memorize
//
//  Created by Junkang Zhang on 22/08/2021.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numbersOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for idx in 0..<numbersOfPairsOfCards {
            let cardContent = createCardContent(idx)
            cards.append(Card(content: cardContent))
            cards.append(Card(content: cardContent))
        }
        
    }
    
    func choose(_ card: Card) {}
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
