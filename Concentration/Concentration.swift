//
//  Concentration.swift
//  Concentration
//
//  Created by H Hugo Falkman on 2018-01-21.
//  Copyright © 2018 H Hugo Falkman. All rights reserved.
//

import Foundation

class Concentration {

    var cards = [Card]()
    
    var indexOfOneFaceUp: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneFaceUp, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneFaceUp = nil
            } else {
                // either 0 or 2 cards faceup
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneFaceUp = index
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TO DO: Shuffle the cards
    }
}

