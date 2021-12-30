//
//  MemoryGame.swift
//  Memorize
//
//  Created by Junkang Zhang on 22/08/2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    init(numbersOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for idx in 0..<numbersOfPairsOfCards {
            let cardContent = createCardContent(idx)
            cards.append(Card(content: cardContent, id: idx*2))
            cards.append(Card(content: cardContent, id: idx*2+1))
        }
        print("cards: \(cards)")
        
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIdx = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIdx].isFaceUp,
           !cards[chosenIdx].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIdx].content == cards[potentialMatchIndex].content {
                    cards[chosenIdx].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIdx
            }
            cards[chosenIdx].isFaceUp.toggle()
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
