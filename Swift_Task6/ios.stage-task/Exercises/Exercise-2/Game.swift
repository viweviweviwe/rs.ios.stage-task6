//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        if players.count < 2 {
            return nil
        }
        var firstAttackingPlayer = Player()
        var currentMinTrumpIndex = Value.allCases.count
        var someoneHaveTrump = false
        for player in players {
            for i in 0..<6 {
                if player.hand?[i].isTrump == true {
                    someoneHaveTrump = true
                    guard let indexTrumpCardOnHand = player.hand?[i].value.rawValue
                    else {return nil}
                    if indexTrumpCardOnHand < currentMinTrumpIndex {
                        currentMinTrumpIndex = indexTrumpCardOnHand
                        firstAttackingPlayer = player
                    }
                }
            }
        }
        if someoneHaveTrump != true {
            print("no one player has a trump card")
            return nil
        }
        
        return firstAttackingPlayer
    }
}
