//
//  CardController.swift
//  DeckOfCards
//
//  Created by adetokunbo babatunde on 6/16/20.
//  Copyright © 2020 AdetokunboBabatunde. All rights reserved.
//

import UIKit

class CardControlller {
    
    static let finalURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1")
    static func fetchCard(completion: @escaping (Result<Card, CardError>) -> Void) {
        // 1 - Prepare URL
        guard let finalURL = finalURL else {return completion(.failure(.invalidURL))}
        // 2 - URLSession - DataTask
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
           // 3 - Handle Errors
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            // 4 - Check for data
            guard let data = data else {return completion(.failure(.noData))}
            // 5 - Decode a Card
            do {
                let topLevel = try JSONDecoder().decode(TopLevelObject.self, from: data)
                let card = topLevel.cards[0]
                return completion(.success(card))
            } catch {
                print(error)
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    static func fetchImage(for card: Card, completion: @escaping (Result<UIImage, CardError>) -> Void) {
        // 1 - Prepare URL
        let finalURL = card.image
        // 2 - Contact Server
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            // 3 - Handle Error
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            // 4 - Check for Image data
            guard let data = data else {return completion(.failure(.noData))}
            
            // 5 - Initialize an image from the data
            guard let image = UIImage(data: data) else {return completion(.failure(.unableToDecode))}
            return completion(.success(image))
        }.resume()
    }
    
  
}
