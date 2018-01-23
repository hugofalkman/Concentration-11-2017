//
//  Card.swift
//  Concentration
//
//  Created by H Hugo Falkman on 2018-01-21.
//  Copyright © 2018 H Hugo Falkman. All rights reserved.
//

import Foundation

struct Card: Hashable {
    
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var idMaker = 0
    
    private static func getUniqueIdentifier() -> Int {
        idMaker += 1
        return idMaker
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
