//
//  LoginViewController.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-02.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: class {
    func loginViewControllerDidLogin(_ controller: LoginViewController)
}

class LoginViewController: UIViewController, ShowsLoading {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!

    weak var delegate: LoginViewControllerDelegate?
    var spinner: UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()

        signInButton.applyRoundButtonStyle(color: .orange)
    }
    
    @IBAction func loginButtonTouchUpInside(_ sender: UIButton) {

        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        showLoadingIndicator()
        signInButton.isEnabled = false
        AuthenticationManager().signInUser(withEmail: email, password: password) { [weak self] error in
            guard let self = self else { return }
            self.removeLoadingIndicator()
            guard error == nil else {
                self.showAlert(withTitle: "Error", message: error!.localizedDescription)
                return
            }
            self.signInButton.isEnabled = true
            self.delegate?.loginViewControllerDidLogin(self)
        }
    }
}
