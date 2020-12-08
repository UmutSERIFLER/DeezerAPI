//
//  ViewController+Extension.swift
//  DeezerAPI
//
//  Created by Umut SERIFLER on 07/12/2020.
//

import UIKit

extension UIViewController {
  func showAlert(withMessage message: String, title: String = "Error") {
    DispatchQueue.main.async { [weak self] in
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self?.present(alert, animated: true, completion: nil)
    }
  }
}
