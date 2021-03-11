//
//  SignUpView.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 10/03/2021.
//

import UIKit

class SignUpView: UIView {

    //MARK: - Properties
    
    private var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.init(systemName: "xmark"), for: .normal)
        button.tintColor = .gray
        button.backgroundColor = .rectangularViewBackgroundColor
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.white.cgColor
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel().createTitleLabel(withText: "Sign Up")
        return label
    }()
    
    private lazy var circleView: RoundedCornerView =  {
        let view = RoundedCornerView().addCircleView(withLabel: titleLabel)
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
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel().createLabel(withText: "Name:")
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let tf = UITextField().createTextField(isSecureTextEntry: false)
        return tf
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
    
    private lazy var signUpButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Avenir Next Medium Italic", size: 20)
        return button
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
        
        [backButton, rectangularView, circleView].forEach { (subview) in
            self.addSubview(subview)
        }
        
        [nameLabel, nameTextField ,emailLabel, emailTextField, passwordLabel, passwordTextField, signUpButton].forEach { (subview) in
            rectangularView.addSubview(subview)
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        //Back Button
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: -10),
            backButton.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
        
        //Rectangular View
        NSLayoutConstraint.activate([
            rectangularView.leftAnchor.constraint(equalTo: self.leftAnchor),
            rectangularView.rightAnchor.constraint(equalTo: self.rightAnchor),
            rectangularView.heightAnchor.constraint(equalToConstant: 450),
            rectangularView.topAnchor.constraint(equalTo: self.topAnchor, constant: 75)
        ])
        
        //Circle View
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: rectangularView.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: rectangularView.topAnchor)
        ])
        
        //Name Label
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: rectangularView.topAnchor, constant: 90),
            nameLabel.leftAnchor.constraint(equalTo: rectangularView.leftAnchor, constant: 20),
            nameLabel.rightAnchor.constraint(equalTo: rectangularView.rightAnchor, constant: -20)
        ])
        
        //Name TextField
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leftAnchor.constraint(equalTo: rectangularView.leftAnchor, constant: 20),
            nameTextField.rightAnchor.constraint(equalTo: rectangularView.rightAnchor, constant: -20)
        ])
        
        //Email Label
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
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
        
        //Sign Up Button
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            signUpButton.leftAnchor.constraint(equalTo: rectangularView.leftAnchor, constant: 20),
            signUpButton.rightAnchor.constraint(equalTo: rectangularView.rightAnchor, constant: -20)
        ])
    }
}
