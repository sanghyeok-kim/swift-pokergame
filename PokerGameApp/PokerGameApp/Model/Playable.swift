//
//  Playable.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/26.
//

import Foundation

protocol Playable {
    var name: String { get }
    var hand: Hand { get }
    func receive(card: Card)
}
