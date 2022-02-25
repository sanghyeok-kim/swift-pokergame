//
//  Player.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/23.
//

import Foundation

protocol Playable {
    var name: String { get }
    var hand: Hand { get set }
    mutating func receive(card: Card)
}

struct Player: Playable {
    
    private(set) var name: String
    var hand: Hand
    
    init() {
        self.hand = Hand()
        self.name = "a"
    }
}

extension Playable {
    mutating func receive(card: Card) {
        self.hand.receive(card: card)
    }
}

