//
//  LoginAppModel.swift
//  FeatureLogin
//
//  Created by Dmitrii Voronin on 01.12.2021.
//

import Foundation
import Combine

final class LoginAppModel {
    private let authUseCase: AuthUseCase
    
    init(authUseCase: AuthUseCase) {
        self.authUseCase = authUseCase
    }
    
    func login(userName: String, password: String, completion: ((UUID) -> Void)?) {
        Task {
            let result = await authUseCase.auth(login: userName, password: password)
            DispatchQueue.main.async {
                switch result {
                case .success(let uuid):
                    completion?(uuid)
                case .failure(_):
                    return
                }
            }
        }
//        print("username: \(userName) - password: \(password)")
//        completion?()
    }
}
