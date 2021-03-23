//
//  LoginView.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 09/03/2021.
//

import UIKit

protocol LoginViewDelegate {
    func showSignUpView()
}


class LoginView: UIView {
    
    //MARK: - Properties
    
    var delegate: LoginViewDelegate?
    
    private var titleLabel: UILabel = {
        let label = UILabel().createTitleLabel(withText: "Login")
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
        button.addTarget(self, action: #selector(handleShowSingUp), for: .touchUpInside)
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
    
    //MARK: - Selectors
    
    @objc private func handleShowSingUp() {
        delegate?.showSignUpView()
    }
    
    //MARK: - Helper Functions
    
    private func setupView() {
        
        
        backgroundColor = .clear
        
        [rectangularView, circleView].forEach { (subview) in
            self.addSubview(subview)
        }
        
        [loginButton, showSignUpViewButton, faceIDImage].forEach { (subview) in
            rectangularView.addSubview(subview)
        }
        
        //Setup constraints
        //Rectangular View
        rectangularView.anchor(top: topAnchor,
                               left: leftAnchor,
                               right: rightAnchor,
                               paddingTop: 75, height: 400)
        
        //Circle View
        circleView.centerX(inView: rectangularView)
        circleView.centerYAnchor.constraint(equalTo: rectangularView.topAnchor).isActive = true
        
        //stack with the email label/textField and password label/textField
        let stack = UIStackView(arrangedSubviews: [emailLabel, emailTextField, passwordLabel, passwordTextField])
        stack.axis = .vertical
        stack.spacing = 10
        rectangularView.addSubview(stack)
        stack.anchor(top: rectangularView.topAnchor,
                     left: rectangularView.leftAnchor,
                     right: rectangularView.rightAnchor,
                     paddingTop: 90, paddingLeft: 20, paddingRight: 20)
        
        //Login Button
        loginButton.anchor(top: stack.bottomAnchor,
                           left: rectangularView.leftAnchor,
                           right: rectangularView.rightAnchor,
                           paddingTop: 15, paddingLeft: 20, paddingRight: 20)
        
        //ShowSignUpViewButton
        showSignUpViewButton.anchor(top: loginButton.bottomAnchor,
                                    right: rectangularView.rightAnchor,
                                    paddingTop: 10, paddingRight: 8)
        
        //Face ID Image
        faceIDImage.anchor(left: rectangularView.leftAnchor, bottom: rectangularView.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
    }
}
