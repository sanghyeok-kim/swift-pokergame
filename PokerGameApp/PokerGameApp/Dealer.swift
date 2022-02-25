//
//  Dealer.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/23.
//

import Foundation

protocol Dealable: Playable {
    var cardDeck: CardDeck { get }
    func canDrawCards(count: Int) -> Bool
    mutating func generateShuffledCardDeck()
    mutating func drawCards(count: Int) -> [Card]
}

struct Dealer: Dealable {
    
    private(set) var cardDeck: CardDeck
    private(set) var name: String
    var hand: Hand
    
    init() {
        self.cardDeck = CardDeck()
        self.name = "Dealer"
        self.hand = Hand()
    }
    
    func canDrawCards(count: Int) -> Bool {
        return cardDeck.count >= count
    }
    
    func distributeCards(stud: Int, players: Participants) {
        let totalNeedCardCount = stud * players
        if canDrawCards(count: )
    }
}

extension Dealer {
    mutating func generateShuffledCardDeck() {
        cardDeck.setUpCards()
        cardDeck.shuffle()
    }
    
    mutating func drawCards(count: Int) -> [Card] {
        var cards: [Card] = []
        (0..<count).forEach { _ in
            cards.append(cardDeck.draw())
        }
        return cards
    }
}

