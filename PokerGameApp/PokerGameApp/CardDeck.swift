//
//  CardDeck.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/23.
//

import Foundation

class CardDeck {
    
    private var cards: [Card] = []
    
    var count: Int {
        return cards.count
    }
    
    init() {
        setUpCards()
    }
    
    func setUpCards() {
        let faces = Card.FaceData.allCases
        let numerics = Card.NumericData.allCases
        
        faces.forEach { faceData in
            numerics.forEach { numericData in
                cards.append(Card(faceData: faceData, numericData: numericData))
            }
        }
    }
    
    func shuffle() {
        var maxIndex = count - 1
        
        while maxIndex != 0 {
            let randomIndex = Int.random(in: (0...maxIndex))
            self.cards.swapAt(randomIndex, maxIndex)
            maxIndex -= 1
        }
    }
    
    func draw() -> Card {
        return self.cards.removeFirst()
    }
    
    func reset() {
        cards.removeAll()
        setUpCards()
    }
}

extension CardDeck: Equatable {
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        return lhs.cards == rhs.cards
    }
}
