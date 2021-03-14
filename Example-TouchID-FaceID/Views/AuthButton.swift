//
//  AuthButton.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 10/03/2021.
//

import UIKit

class AuthButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(UIColor.white, for: .normal)
        backgroundColor = .circleViewBackgroundColor
        layer.cornerRadius = 3
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
