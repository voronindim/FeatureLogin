//
//  AuthGateway.swift
//  FeatureLogin
//
//  Created by Дмитрий Воронин on 08.01.2022.
//

import Foundation
import Networking

struct GatewayResultWithToken {
    let uuid: UUID
    let token: String
}

final class AuthGateway {
    private let apiSession: AsyncGenericApi
    
    init(apiSession: AsyncGenericApi) {
        self.apiSession = apiSession
    }
    
    func auth(login: String, password: String) async -> Result<GatewayResultWithToken, GatewayError> {
        do {
            let gatewayResult: GatewayResult = try await apiSession.postRequest(data: GatewayRequest(login: login, password: password), with: urlRequest())
            guard gatewayResult.errorCode == 0 else {
                return .failure(.loginError)
            }
            return .success(GatewayResultWithToken(uuid: UUID(uuidString: gatewayResult.guid)!, token: gatewayResult.token))
        } catch {
            return .failure(.unknownError)
        }
    }
    
    private func urlRequest() -> URLRequest {
        let url = baseUrl.appendingPathComponent("Employee/auth", isDirectory: false)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        return request
    }
    
}

fileprivate struct GatewayRequest: Encodable {
    let login: String
    let password: String
}

fileprivate struct GatewayResult: Decodable {
    let errorCode: Int
    let guid: String
    let token: String
}
