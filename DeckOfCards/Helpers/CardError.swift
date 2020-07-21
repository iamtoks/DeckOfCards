//
//  CardError.swift
//  DeckOfCards
//
//  Created by adetokunbo babatunde on 6/16/20.
//  Copyright © 2020 AdetokunboBabatunde. All rights reserved.
//

import Foundation

enum CardError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
       
        case .invalidURL:
            return "Unable to reach the server."
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "The sever responded with no data."
        case .unableToDecode:
            return "The server responded with bad data."
        }
    }
}
