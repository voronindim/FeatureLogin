//
//  AuthUseCase.swift
//  FeatureLogin
//
//  Created by Дмитрий Воронин on 08.01.2022.
//

import Foundation

final class AuthUseCase {
    private let gateway: AuthGateway
    
    init(gateway: AuthGateway) {
        self.gateway = gateway
    }
    
    func auth(login: String, password: String) async -> Result<UUID, UseCaseError> {
        switch await gateway.auth(login: login, password: password) {
        case .success(let uuid):
            return .success(uuid)
        case .failure(_):
            return .failure(.unknownError)
        }
    }
}
