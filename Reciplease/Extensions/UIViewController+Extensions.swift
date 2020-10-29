//
//  UIViewController+Extensions.swift
//  Reciplease
//
//  Created by ousama boujaouane on 29/10/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(title: String, message: String, buttonTitle: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: buttonTitle, style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
