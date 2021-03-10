//
//  RoundedCornerViewExtension-Circle.swift
//  Example-TouchID-FaceID
//
//  Created by Justyna Kowalkowska on 10/03/2021.
//

import UIKit

extension RoundedCornerView {
    func addCircleView(withLabel label: UILabel) -> RoundedCornerView {
        let view = RoundedCornerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .circleViewBackgroundColor
        view.addSubview(label)
        view.borderColor = .white
        view.cornerRadius = 75
        view.borderWidth = 4
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view.heightAnchor.constraint(equalToConstant: 150),
            view.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        return view
    }
}

