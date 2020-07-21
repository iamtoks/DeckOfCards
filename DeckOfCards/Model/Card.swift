//
//  Card.swift
//  DeckOfCards
//
//  Created by adetokunbo babatunde on 6/16/20.
//  Copyright © 2020 AdetokunboBabatunde. All rights reserved.
//

import Foundation

struct Card: Decodable {
    var value: String
    var suit: String
    var image: URL
}

struct TopLevelObject: Decodable {
    var cards: [Card]
}
