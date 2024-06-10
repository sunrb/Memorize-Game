//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Rubing on 6/6/24.
//

import SwiftUI


class EmojiMemoryGame:ObservableObject {
    
    private static let emojis = ["👻", "😈", "💀", "🎃", "🤡", "😺", "💀", "🕷️", "🐙", "🦋", "🧙‍♀️", "🧚‍♀️"]

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfParisOfCards: 12) {pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
        
    @Published private var model = createMemoryGame()
    
    //MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
