//
//  ShowsLoading.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-03.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import UIKit

protocol ShowsLoading: class {
    var spinner: UIActivityIndicatorView? { get set }
    func showLoadingIndicator()
    func removeLoadingIndicator()
}
extension ShowsLoading where Self: UIViewController {

    func showLoadingIndicator() {
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.startAnimating()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.spinner = spinner
    }

    func removeLoadingIndicator() {
        spinner?.stopAnimating()
        spinner?.removeFromSuperview()
    }
}
