//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Junkang Zhang on 22/08/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let themes: [Theme<String>] = [
        Theme<String>(name: "Transportations", emojis: ["🚒", "✈️", "🚐", "🚝", "🚤", "🚇","🛸","🛶"], numberOfCards: 6, color: "red"),
        Theme<String>(name: "Faces", emojis: ["😀", "🥲", "🥰", "😍", "😜"], numberOfCards: 10, color: "green"),
        Theme<String>(name: "Animals", emojis: ["🐸", "🐶", "🦉", "🐵"], numberOfCards: 4, color: "blue"),
        Theme<String>(name: "Foods", emojis: ["🍏", "🍎", "🍐", "🫐", "🥬"], numberOfCards: 3, color: "purple"),
        Theme<String>(name: "Sports", emojis: ["⚽️", "🏀", "🏈"], numberOfCards: 2, color: "grey"),
        Theme<String>(name: "Flags", emojis: ["🏳️", "🇺🇳", "🇴🇲"], numberOfCards: 2, color: "black"),
    ]
    
    @Published private var model: MemoryGame<String>
    
    @Published public var themeColor: Color
    
    @Published public var gameTitle: String
    
    init() {
        let idx = Int.random(in: 0..<EmojiMemoryGame.themes.count)
        model = EmojiMemoryGame.createMemoryGame(withTheme: EmojiMemoryGame.themes[idx])
        gameTitle = EmojiMemoryGame.themes[idx].name
        switch EmojiMemoryGame.themes[idx].color {
            case "red": themeColor = .red
            case "green": themeColor = .green
            case "blue": themeColor = .blue
            case "black": themeColor = .black
            case "yellow": themeColor = .yellow
            default:themeColor = .purple
        }
    }
    
    static func createMemoryGame (withTheme theme: Theme<String>) -> MemoryGame<String> {
        if theme.numberOfCards >= theme.emojis.count {
            return MemoryGame<String>(numbersOfPairsOfCards: theme.numberOfCards, createCardContent: {idx in theme.emojis[idx]})
        } else {
            let newArray = getRandomElementsArray(withOriginalArray: theme.emojis, newCount: theme.numberOfCards)
            return MemoryGame<String>(numbersOfPairsOfCards: theme.numberOfCards, createCardContent: {idx in newArray[idx]})
        }
    }
    
    static func getRandomElementsArray(withOriginalArray a: [String], newCount: Int) -> [String] {
        var selected: Set<Int> = []
        var res: [String] = []
        var i: Int
        while selected.count < newCount {
            repeat {
                i = Int.random(in: 0..<a.count)
            } while selected.contains(i)
            res.append(a[i])
            selected.insert(i)
        }
        return res
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    // Mark: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        let idx = Int.random(in: 0..<EmojiMemoryGame.themes.count)
        model = EmojiMemoryGame.createMemoryGame(withTheme: EmojiMemoryGame.themes[idx])
        gameTitle = EmojiMemoryGame.themes[idx].name
        switch EmojiMemoryGame.themes[idx].color {
            case "red": themeColor = .red
            case "green": themeColor = .green
            case "blue": themeColor = .blue
            case "black": themeColor = .black
            case "yellow": themeColor = .yellow
            default:themeColor = .purple
        }
    }
}
