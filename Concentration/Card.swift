//
//  Card.swift
//  Concentration
//
//  Created by H Hugo Falkman on 2018-01-21.
//  Copyright © 2018 H Hugo Falkman. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var idMaker = 0
    
    static func getUniqueIdentifier() -> Int {
        idMaker += 1
        return idMaker
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
