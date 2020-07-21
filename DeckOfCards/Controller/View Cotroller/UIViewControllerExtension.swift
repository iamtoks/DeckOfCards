//
//  UIViewControllerExtension.swift
//  DeckOfCards
//
//  Created by adetokunbo babatunde on 6/16/20.
//  Copyright © 2020 AdetokunboBabatunde. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentErrorToUser(localizedError: LocalizedError) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error", message: localizedError.errorDescription, preferredStyle: .actionSheet)
            let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(dismissAction)
            self.present(alertController, animated: true)
        }
    }
    
}
