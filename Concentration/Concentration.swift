//
//  Concentration.swift
//  Concentration
//
//  Created by H Hugo Falkman on 2018-01-21.
//  Copyright © 2018 H Hugo Falkman. All rights reserved.
//

import Foundation

class Concentration {

    private(set) var cards = [Card]()
    
    private var indexOfOneFaceUp: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil{
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneFaceUp, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneFaceUp = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): at least one pair of cards")
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TO DO: Shuffle the cards
    }
}

