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





    // func testAuth() {
    //        Auth.auth().addStateDidChangeListener { (auth, user) in
    //            if user != nil {
    //                // user is signed in
    //                print( "go to feature controller")
    //                print("User uid \(user?.uid)")
    //                 print("User email \(user?.email)")
    //                 print("User displayname \(user?.displayName)")
    //            } else {
    //                 // user is not signed in
    //                 print("go to login controller")
    //            }
    //        }
    //        do {
    //        try Auth.auth().signOut()
    //        } catch {
    //            print("Fail to logoutt")
    //        }
