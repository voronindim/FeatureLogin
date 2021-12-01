//
//  Coordinator.swift
//  FeatureLogin
//
//  Created by Dmitrii Voronin on 01.12.2021.
//

import Foundation
import UIKit

final class Coordinator {
    
    // MARK: - Private Properties
    
    private let navigationController: UINavigationController
    private let viewControllerFactory: ViewControllerFactory
    
    // MARK: - Initialize
    
    init(navigationController: UINavigationController, viewControllerFactory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.viewControllerFactory = viewControllerFactory
    }

    // MARK: - Public Methods
    
    func showLoginView() {
        let viewController = viewControllerFactory.loginViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
