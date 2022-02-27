//
//  PokerGame.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/25.
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
        
        func loop(event: () -> Void) {
            (0..<cardCountForGame).forEach { _ in
                event()
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

        func loop(event: (Int) -> Void) {
            (0...excludeDealer).forEach { playerIndex in
                event(playerIndex)
            }
        }
    }

    private(set) var stud: Stud
    private(set) var playerCount: PlayerCount
    private var dealer: Dealer
    private(set) var participants: Participants

    init(stud: Stud, playerCount: PlayerCount) {
        self.stud = stud
        self.playerCount = playerCount
        self.dealer = Dealer()
        self.participants = Participants(playerCount: playerCount.excludeDealer, dealer: dealer)
    }
    
    func distributeCard(playerIndex: Int) {
        let card = dealer.drawCard()
        participants.players[playerIndex].receive(card: card)
    }
    
    func distributeCardIterator() {
        playerCount.loop(event: distributeCard)
    }
    
    func start() {
        if dealer.canDrawCards(count: stud.cardCountForGame * participants.count) {
            dealer.setUpPokerGame(stud: stud.cardCountForGame, participants: participants)
            
            stud.loop {
                distributeCardIterator()
            }
        }
        else {
            return
        }
    }
}
