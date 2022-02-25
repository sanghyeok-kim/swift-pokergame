//
//  PokerGame.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/23.
//

import Foundation

struct PokerGame {
    
    enum Stud: Int {
        case five
        case seven
        
        var cardCountForGame: Int {
            switch self {
            case .five:
                return 5
            case .seven:
                return 7
            }
        }
    }
    
    enum PlayerCount: Int {
        case one = 1
        case two
        case three
        case four
        
        var excludeDealer: Int {
            return self.rawValue
        }
    }

    private var stud: Stud
    private var playerCount: PlayerCount
    private var dealer: Dealer
    private var players: Participants
    
    init(stud: Stud, playerCount: PlayerCount) {
        self.stud = stud
        self.playerCount = playerCount
        self.dealer = Dealer()
        self.players = Participants(playerCount: playerCount.excludeDealer, dealer: dealer)
    }
    
    func hasSufficientCards() -> Bool {
        return dealer.canDrawCards(count: )
    }
    
    mutating func distributeCards() {
        (0..<playerCount.excludeDealer).forEach { player in
            let newCard = dealer.drawCards(count: stud.cardCountForGame)
            players[player].receive(cards: newCard)
        }
    }
    
    mutating func start() {
        if hasSufficientCards() {
            distributeCards()
        }
        else {
            return
        }
    }
}
