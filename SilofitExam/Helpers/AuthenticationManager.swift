//
//  AuthenticationManager.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-01.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthenticationManager {

    var currentLoggedInUser: User? {
        return Auth.auth().currentUser
    }

    func singUp(newUser: UserFrom, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: newUser.email, password: newUser.password) { authResult, error in
            completion(error)
        }
    }

    func signInUser(withEmail email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            completion(error)
        }
    }

    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Fail to logout")
        }
    }
}
