//
//  LoginModule.swift
//  FeatureLogin
//
//  Created by Dmitrii Voronin on 01.12.2021.
//

import Foundation
import UIKit

public final class LoginModule {
    private let coordinator: Coordinator
    
    public init(rootNavigationController: UINavigationController, successLoginHandler: @escaping () -> Void) {
        let appModel = LoginAppModel()
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
