//
//  UserForm.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-02.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import Foundation

struct UserFrom {
    var email: String
    var password: String
    // More field to be added later

    enum FormError: Error {
        case invalidEmail
        case invalidPassword

        var localizedDescription: String {
            switch self {
            case .invalidEmail: return "Invalid Email"
            case .invalidPassword: return "Invalid password"
            }
        }
    }
}
