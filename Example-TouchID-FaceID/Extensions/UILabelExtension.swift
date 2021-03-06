//
//  UILabelExtension.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 10/03/2021.
//

import UIKit

extension UILabel {
    
    func createLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = text
        label.textAlignment = .left
        label.font = UIFont.init(name: "Avenir Next", size: 19)
        return label
    }
    
    func createTitleLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.init(name: "Avenir Next Medium Italic", size: 28)
        return label
    }
}

