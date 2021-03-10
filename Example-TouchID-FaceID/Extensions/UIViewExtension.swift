//
//  UIViewExtension.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 10/03/2021.
//

import UIKit

extension UIView {
    func inputContainerView(textField: UITextField, title: String) -> UIView {
        
        let view = UIView()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = title
            label.font = UIFont.init(name: "Avenir Next Italic", size: 19)
            return label
        }()
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
            
        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
        return view
    }
}
