//
//  LoginModule.swift
//  FeatureLogin
//
//  Created by Dmitrii Voronin on 01.12.2021.
//

import Foundation
import UIKit
import Networking

public final class LoginModule {
    private let coordinator: Coordinator
    
    public init(rootNavigationController: UINavigationController, apiSession: AsyncGenericApi, successLoginHandler: @escaping (UUID, _ token: String) -> Void) {
        let gateway = AuthGateway(apiSession: apiSession)
        let useCase = AuthUseCase(gateway: gateway)
        let appModel = LoginAppModel(authUseCase: useCase)
        let viewControllerFactory = ViewControllerFactory(appModel: appModel, successLoginHandler: successLoginHandler)
        coordinator = Coordinator(navigationController: rootNavigationController, viewControllerFactory: viewControllerFactory)
    }
    
    public func start() {
        coordinator.showLoginView()
    }
    
    deinit {
        print("deinit")
    }
    
}
