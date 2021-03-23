//
//  SignUpView.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 10/03/2021.
//

import UIKit

protocol SignUpViewDelegate {
    func closeSignUpView()
}

class SignUpView: UIView {

    //MARK: - Properties
    
    var delegate: SignUpViewDelegate?
    
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
        button.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
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
        button.isEnabled = true
        button.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
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
    
    //MARK: - Selectors
    
    @objc func didTapSignUpButton() {
        guard let name = nameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text
        else {
            return
        }
        
        print("Name: \(name), email: \(email), password: \(password)")
        
    }
    
    @objc func didTapCloseButton() {
        delegate?.closeSignUpView()
    }
    
    //MARK: - Helper Functions
    
    private func setupView() {
        
        backgroundColor = .clear
        
        [backButton, rectangularView, circleView].forEach { (subview) in
            self.addSubview(subview)
        }

        //Setup constraints
        //Back Button
        backButton.anchor(top: topAnchor,
                          right: rightAnchor,
                          paddingTop: -10)
        
        //Rectangular View
        rectangularView.anchor(top: topAnchor,
                               left: leftAnchor,
                               right: rightAnchor,
                               paddingTop: 75, height: 450)
        
        //Circle View
        circleView.centerX(inView: rectangularView)
        circleView.centerYAnchor.constraint(equalTo: rectangularView.topAnchor).isActive = true
        
        //Stack with the name label/textField, email label/textField and password label/textField
        let stack = UIStackView(arrangedSubviews: [nameLabel, nameTextField, emailLabel, emailTextField, passwordLabel, passwordTextField])
        stack.axis = .vertical
        stack.spacing = 10
        
        rectangularView.addSubview(stack)
        stack.anchor(top: rectangularView.topAnchor,
                     left: rectangularView.leftAnchor,
                     right: rectangularView.rightAnchor,
                     paddingTop: 90, paddingLeft: 20, paddingRight: 20)
        
        //Sign Up Button
        rectangularView.addSubview(signUpButton)
        signUpButton.anchor(top: stack.bottomAnchor,
                            left: rectangularView.leftAnchor,
                            right: rectangularView.rightAnchor,
                            paddingTop: 15, paddingLeft: 20, paddingRight: 20)
    }
}
