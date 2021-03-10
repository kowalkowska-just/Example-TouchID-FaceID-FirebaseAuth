//
//  UITextFieldExtension.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 10/03/2021.
//

import UIKit

extension UITextField {
    
    func createTextField(isSecureTextEntry: Bool) -> UITextField {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = .roundedRect
        tf.font = UIFont.init(name: "Avenir Next", size: 15)
        tf.textColor = .gray
        tf.keyboardAppearance = .light
        tf.isSecureTextEntry = isSecureTextEntry
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return tf
    }
}
