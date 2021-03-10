//
//  UIColorExtension.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 09/03/2021.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
            return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    static let bottomGradientColor = UIColor.rgb(red: 107, green: 86, blue: 188)
    static let topGradientColor = UIColor.rgb(red: 149, green: 142, blue: 208)
    static let circleViewBackgroundColor = UIColor.rgb(red: 128, green: 198, blue: 191)
    static let rectangularViewBackgroundColor = UIColor.rgb(red: 215, green: 211, blue: 239)
}
