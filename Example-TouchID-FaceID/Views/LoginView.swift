//
//  LoginView.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 09/03/2021.
//

import UIKit

class LoginView: RoundedCornerView {
    
    //MARK: - Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Login"
        label.textAlignment = .center
        label.font = UIFont.init(name: "Avenir Next Medium Italic", size: 28)
        return label
    }()
    
    private lazy var circleView: RoundedCornerView =  {
        let view = RoundedCornerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .circleViewBackgroundColor
        view.addSubview(titleLabel)
        view.borderColor = .white
        view.cornerRadius = 75
        view.borderWidth = 4
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view.heightAnchor.constraint(equalToConstant: 150),
            view.widthAnchor.constraint(equalToConstant: 150)
        ])
        return view
    }()
    
    private lazy var rectangularView: RoundedCornerView = {
        let view = RoundedCornerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .rectangularViewBackgroundColor
        view.borderColor = .white
        view.borderWidth = 4
        view.cornerRadius = 10
        
        return view
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel().createLabel(withText: "Email:")
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let tf = UITextField().createTextField(isSecureTextEntry: false)
        return tf
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel().createLabel(withText: "Password:")
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField().createTextField(isSecureTextEntry: true)
        return tf
    }()
    
    private lazy var loginButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Avenir Next Medium Italic", size: 20)
        return button
    }()
    
    private var showSignUpViewButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.init(name: "Avenir Next Medium Italic", size: 18)
        button.titleLabel?.textAlignment = .right
        return button
    }()
    
    private var faceIDImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage.init(systemName: "faceid")
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        image.widthAnchor.constraint(equalToConstant: 45).isActive = true
        return image
    }()
    
    
    //MARK: - Inicializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper Functions
    
    private func setupView() {
        
        backgroundColor = .clear
        
        [rectangularView, circleView, emailLabel, emailTextField, passwordLabel, passwordTextField, loginButton].forEach { (subview) in
            self.addSubview(subview)
        }
        
        [emailLabel, emailTextField, passwordLabel, passwordTextField, loginButton, showSignUpViewButton, faceIDImage].forEach { (subview) in
            rectangularView.addSubview(subview)
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        //Rectangular View
        NSLayoutConstraint.activate([
            rectangularView.leftAnchor.constraint(equalTo: self.leftAnchor),
            rectangularView.rightAnchor.constraint(equalTo: self.rightAnchor),
            rectangularView.heightAnchor.constraint(equalToConstant: 400),
            rectangularView.topAnchor.constraint(equalTo: self.topAnchor, constant: 75)
        ])
        
        //Circle View
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: rectangularView.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: rectangularView.topAnchor)
        ])
        
        //Email Label
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: rectangularView.topAnchor, constant: 90),
            emailLabel.leftAnchor.constraint(equalTo: rectangularView.leftAnchor, constant: 20),
            emailLabel.rightAnchor.constraint(equalTo: rectangularView.rightAnchor, constant: -20)
        ])
        
        //Email TextField
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leftAnchor.constraint(equalTo: rectangularView.leftAnchor, constant: 20),
            emailTextField.rightAnchor.constraint(equalTo: rectangularView.rightAnchor, constant: -20)
        ])
        
        //Password Label
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordLabel.leftAnchor.constraint(equalTo: rectangularView.leftAnchor, constant: 20),
            passwordLabel.rightAnchor.constraint(equalTo: rectangularView.rightAnchor, constant: -20)
        ])
        
        //Password TextField
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leftAnchor.constraint(equalTo: rectangularView.leftAnchor, constant: 20),
            passwordTextField.rightAnchor.constraint(equalTo: rectangularView.rightAnchor, constant: -20)
        ])
        
        //Login Button
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            loginButton.leftAnchor.constraint(equalTo: rectangularView.leftAnchor, constant: 20),
            loginButton.rightAnchor.constraint(equalTo: rectangularView.rightAnchor, constant: -20)
        ])
        
        //ShowSignUpViewButton
        NSLayoutConstraint.activate([
            showSignUpViewButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            showSignUpViewButton.rightAnchor.constraint(equalTo: rectangularView.rightAnchor, constant: -8)
        ])
        
        //Face ID Image
        NSLayoutConstraint.activate([
            faceIDImage.bottomAnchor.constraint(equalTo: rectangularView.bottomAnchor, constant: -8),
            faceIDImage.leftAnchor.constraint(equalTo: rectangularView.leftAnchor, constant: 8)
        ])
    }
}
