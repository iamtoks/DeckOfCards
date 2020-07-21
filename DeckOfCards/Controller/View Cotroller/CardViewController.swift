//
//  CardViewController.swift
//  DeckOfCards
//
//  Created by adetokunbo babatunde on 6/16/20.
//  Copyright © 2020 AdetokunboBabatunde. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet var cardTextLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func fetchImageAndUpdateViews(for card: Card) {
        CardControlller.fetchImage(for: card) { [weak self] result in
            DispatchQueue.main.async {
                switch result{
                case .success(let image):
                    self?.cardImageView.image = image
                    self?.cardTextLabel.text = "\(card.value) of \(card.suit)"
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        CardControlller.fetchCard{ [weak  self] (result) in
            DispatchQueue.main.async {
            switch result {
            case .success(let card):
                    
                self?.fetchImageAndUpdateViews(for: card)
                
            case .failure(let error):
                self?.presentErrorToUser(localizedError: error)
            }
        }
        }
        
    }
}
