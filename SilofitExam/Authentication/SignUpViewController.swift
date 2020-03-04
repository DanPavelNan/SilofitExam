//
//  SignUpViewController.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-01.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import UIKit

protocol SignUpViewControllerDelegate: class {
    func signUpViewControllerDidSignUp(_ controller: SignUpViewController)
}

class SignUpViewController: UIViewController {


    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!

    weak var delegate: SignUpViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        signUpButton.applyRoundButtonStyle(color: .blue)
    }

    private func validateForm(completion: (Result<UserFrom, UserFrom.FormError>) -> Void) {
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespaces), !email.isEmpty else {
            completion(.failure(.invalidEmail))
            return
        }
        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespaces), !password.isEmpty else {
            completion(.failure(.invalidPassword))
            return
        }

        return completion(.success(UserFrom(email: email, password: password)))
    }

    @IBAction func singUpButtonTouchUpInside(_ sender: UIButton) {

        validateForm { (result) in
            switch result {
            case .failure(let error):
                showAlert(withTitle: "Error", message: error.localizedDescription)
            case .success(let newUser):
                singUp(newUser: newUser)
            }
        }
    }

    func singUp(newUser: UserFrom) {
        AuthenticationManager().singUp(newUser: newUser) { [weak self] (error) in
            guard let self = self else { return }
            guard error == nil else {
                self.showAlert(withTitle: "Error", message: error?.localizedDescription ?? "Something when wrong")
                return
            }
            self.delegate?.signUpViewControllerDidSignUp(self)
        }
    }
}

