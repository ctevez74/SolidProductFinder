//
//  LoginMock.swift
//  ProductFinder
//
//  Created by Carlos Gabriel Tevez on 17/04/2021.
//

import Foundation

enum userTest: String {
    case user = "test"
    case password = "1234"
}

class LoginMock {
    func login(_ user: String,_ password: String, completation: @escaping (Bool?) -> Void) {
        print("Call")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if user == userTest.user.rawValue && password == userTest.password.rawValue {
                    completation(true)
            } else {
                completation(false)
            }
        }

    }
    
}
