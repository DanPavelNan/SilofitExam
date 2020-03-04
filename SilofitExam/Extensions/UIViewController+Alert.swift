//
//  UIViewController+Alert.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-03.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import UIKit

extension UIViewController {

    func showAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
