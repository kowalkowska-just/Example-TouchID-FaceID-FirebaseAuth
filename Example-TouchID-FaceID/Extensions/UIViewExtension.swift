//
//  UIViewContainerView.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 10/03/2021.
//

import UIKit

extension UIView {
    func inputContainerView(textField: UITextField, title: String) -> UIView {
            let view = UIView()
            
            view.addSubview(textField)
            textField.anchor(left: imageView.rightAnchor, right: view.rightAnchor,
                            paddingLeft: 8, paddingRight: 8)
            
            return view
        }
}
