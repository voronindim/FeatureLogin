//
//  LoginViewController.swift
//  FeatureLogin
//
//  Created by Dmitrii Voronin on 28.11.2021.
//

import UIKit

public class LoginViewController: UIViewController {

    
    // MARK: - Private Properties
    
    private let logotypeImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view, image: UIImage(systemName: "envelope"), textField: emailTextField, imageViewTintColor: .white)
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view, image: UIImage(systemName: "lock"), textField: paswordTextField, imageViewTintColor: .white)
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        return textField.textField(withPlaceholder: "E-mail", isSecireTextEntry: false)
    }()
    
    private lazy var paswordTextField: UITextField = {
        let textField = UITextField()
        return textField.textField(withPlaceholder: "Пароль", isSecireTextEntry: true)
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ВОЙТИ", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor.mainBlue(), for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let dontHaveAccauntButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "У вас еще нет аккаунта? ", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSMutableAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(signUpButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Overrides
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
    }
        
    // MARK: - Selectors
    
    @objc private func loginButtonDidTapped() {
        
    }
    
    @objc private func signUpButtonDidTapped() {
        
    }
    
    // MARK: - Private Methods
    
    private func configureViewComponents() {
        view.backgroundColor = UIColor.mainBlue()
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logotypeImageView)
        logotypeImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 0, paddingBottom: 0, padddingRight: 0, width: 150, height: 150)
        logotypeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: logotypeImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, padddingRight: 32, width: 0, height: 50)
        
        view.addSubview(passwordContainerView)
        passwordContainerView.anchor(top: emailContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingBottom: 0, padddingRight: 32, width: 0, height: 50)
        
        view.addSubview(loginButton)
        loginButton.anchor(top: passwordContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, padddingRight: 32, width: 0, height: 50)
        
        view.addSubview(dontHaveAccauntButton)
        dontHaveAccauntButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 12, padddingRight: 32, width: 0, height: 50)
    }
}
