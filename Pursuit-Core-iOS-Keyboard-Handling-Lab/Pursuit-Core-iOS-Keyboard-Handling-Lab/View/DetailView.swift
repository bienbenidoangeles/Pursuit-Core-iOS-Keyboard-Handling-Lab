//
//  DetailView.swift
//  Pursuit-Core-iOS-Keyboard-Handling-Lab
//
//  Created by Bienbenido Angeles on 2/7/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit

class DetailView: UIView {

    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: label.font.pointSize)
        label.text = "Login"
        return label
    }()
    
    lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.setBottomBorder()
        textField.placeholder = "Enter your username"
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.setBottomBorder()
        textField.placeholder = "Enter your password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .black
        //button.titleLabel?.backgroundColor = .black
        //button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: (button.titleLabel?.font.pointSize)!)
        return button
    }()
    
    lazy var passwordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Light", size: (button.titleLabel?.font.pointSize)!)
        return button
    }()
    
    lazy var imageViewCenterYConstrainst: NSLayoutConstraint = {
        imageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: -self.frame.size.height*0.15)
    }()
        
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setupImageViewConstrainsts()
        setupLoginLabelConstrainsts()
        setupUsernameTextfieldConstrainsts()
        setupPasswordTextfieldConstrainsts()
        setupLoginButtonConstrainsts()
        setupPasswordButtonConstrainsts()
    }
    
    private func setupImageViewConstrainsts(){
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
            imageViewCenterYConstrainst,
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupLoginLabelConstrainsts(){
        addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupUsernameTextfieldConstrainsts(){
        addSubview(userNameTextField)
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
            userNameTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            userNameTextField.trailingAnchor.constraint(equalTo: loginLabel.trailingAnchor),
            userNameTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)
        ])
    }
    
    private func setupPasswordTextfieldConstrainsts(){
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: loginLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor)
        ])
    }
    
    private func setupLoginButtonConstrainsts(){
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor)
        ])
    }
    
    private func setupPasswordButtonConstrainsts(){
        addSubview(passwordButton)
        passwordButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 8),
            passwordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordButton.topAnchor.constraint(equalTo: loginButton.centerYAnchor, constant: 30),
        ])
    }
    
}

extension UITextField {
  func setBottomBorder() {
    self.borderStyle = .none
    self.layer.backgroundColor = UIColor.white.cgColor

    self.layer.masksToBounds = false
    self.layer.shadowColor = UIColor.gray.cgColor
    self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
    self.layer.shadowOpacity = 1.0
    self.layer.shadowRadius = 0.0
  }
}
