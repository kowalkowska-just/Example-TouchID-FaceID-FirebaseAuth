//
//  SignUpViewController.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 10/03/2021.
//

import UIKit

class SignUpViewController: UIViewController {

    var signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpView.delegate = self
        configureNavigationBar()
        setupView()
    }
    
    //MARK: - Helper Functions
    
    private func setupView() {
        
        view.addGradientWithColors(.topGradientColor, .bottomGradientColor, direction: .topToBottom)
        
        let widthView = view.frame.width
        
        view.addSubview(signUpView)
        signUpView.frame = CGRect(x: 40, y: 125, width: widthView - 80, height: 500)
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }

}

//MARK: - SignUpViewDelegate

extension SignUpViewController: SignUpViewDelegate {
    func closeSignUpView() {
        navigationController?.popViewController(animated: true)
    }
}
