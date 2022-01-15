//
//  AuthUseCase.swift
//  FeatureLogin
//
//  Created by Дмитрий Воронин on 08.01.2022.
//

import Foundation

struct UseCaseResult {
    let uuid: UUID
    let token: String
    
    init(gatewayResult: GatewayResultWithToken) {
        self.uuid = gatewayResult.uuid
        self.token = gatewayResult.token
    }
}

final class AuthUseCase {
    private let gateway: AuthGateway
    
    init(gateway: AuthGateway) {
        self.gateway = gateway
    }
    
    func auth(login: String, password: String) async -> Result<UseCaseResult, UseCaseError> {
        switch await gateway.auth(login: login, password: password) {
        case .success(let gatewayResult):
            return .success(UseCaseResult(gatewayResult: gatewayResult))
        case .failure(_):
            return .failure(.unknownError)
        }
    }
}
