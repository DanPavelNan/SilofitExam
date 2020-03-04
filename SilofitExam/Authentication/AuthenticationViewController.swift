//
//  AuthenticationViewController.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-01.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import UIKit

protocol AuthenticationViewControllerDelegate: class {
    func authenticationViewControllerDidTapOnSignIn(_ controller: UIViewController)
    func authenticationViewControllerDidTapOnSignUp(_ controller: UIViewController)
}
class AuthenticationViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var buttonsStackBottomConstraint: NSLayoutConstraint!

    weak var delegate: AuthenticationViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        signUpButton.applyRoundButtonStyle(color: .blue)
        signInButton.applyRoundButtonStyle(color: .orange)
        buttonsStackBottomConstraint.constant = -150
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.buttonsStackBottomConstraint.constant = 40
        UIView.animate(withDuration: 0.24) {
            self.view.layoutIfNeeded()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.navigationBar.isHidden = false
    }

    @IBAction func signUpButtonTouchUpInside(_ sender: UIButton) {
        delegate?.authenticationViewControllerDidTapOnSignUp(self)
    }

    @IBAction func signInButtonTouchUpInside(_ sender: UIButton) {
        delegate?.authenticationViewControllerDidTapOnSignIn(self)
    }
}
