//
//  RoundedCornerView.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 09/03/2021.
//

import UIKit

class RoundedCornerView: UIView {

    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
}
