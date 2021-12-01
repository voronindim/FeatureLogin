//
//  LoginAppModel.swift
//  FeatureLogin
//
//  Created by Dmitrii Voronin on 01.12.2021.
//

import Foundation
import Combine

final class LoginAppModel {
    func login(userName: String, password: String, completion: (() -> Void)?) {
        print("username: \(userName) - password: \(password)")
        completion?()
    }
}
