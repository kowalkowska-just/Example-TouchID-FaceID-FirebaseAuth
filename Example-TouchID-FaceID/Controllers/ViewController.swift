//
//  ViewController.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 08/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        
        view.addSubview(loginView)
        let widthView = view.frame.width
        
        loginView.frame = CGRect(x: 40, y: 125, width: widthView - 80, height: 475)
    }


}

