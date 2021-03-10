//
//  LoginViewController.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 08/03/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.delegate = self
        
        configureNavigationBar()
        setupView()
    }
    
    //MARK: - Helper Functions
    
    private func setupView() {
        
        view.addGradientWithColors(.topGradientColor, .bottomGradientColor, direction: .topToBottom)
        
        let widthView = view.frame.width
        
        view.addSubview(loginView)
        loginView.frame = CGRect(x: 40, y: 125, width: widthView - 80, height: 475)
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
}

//MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    func showSignUpView() {
        let signUpController = SignUpViewController()
        signUpController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(signUpController, animated: true)
    }
}

