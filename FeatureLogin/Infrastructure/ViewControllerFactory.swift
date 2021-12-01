//
//  ViewControllerFactory.swift
//  FeatureLogin
//
//  Created by Dmitrii Voronin on 01.12.2021.
//

import Foundation
import UIKit
import SwiftUI

final class ViewControllerFactory {
    
    // MARK: - Private Proeprties
    
    private let appModel: LoginAppModel
    private let successLoginHandler: () -> Void
    
    // MARK: - Initiaize
    
    init(appModel: LoginAppModel, successLoginHandler: @escaping () -> Void) {
        self.appModel = appModel
        self.successLoginHandler = successLoginHandler
    }
    
    func loginViewController() -> UIViewController {
        let loginView = LoginPageView { userName, password in
            self.appModel.login(userName: userName, password: password, completion: { [weak self] in
                self!.successLoginHandler()
            })
        } forgotButtonDidTapped: {
        } signupButtonDidTapped: {
        }

        return UIHostingController(rootView: loginView)
    }
    
}
