//
//  UIView+Extensions.swift
//  GreenMovies
//
//  Created by Antonio Flores on 07/03/24.
//

import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil, height: CGFloat? = nil,
                centerX: NSLayoutXAxisAnchor? = nil,
                centerY: NSLayoutYAxisAnchor? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let activeTop = top {
            topAnchor.constraint(equalTo: activeTop, constant: paddingTop).isActive = true
        }
        
        if let activeLeft = left {
            leftAnchor.constraint(equalTo: activeLeft, constant: paddingLeft).isActive = true
        }
        
        if let activeBottom = bottom {
            bottomAnchor.constraint(equalTo: activeBottom, constant: -paddingBottom).isActive = true
        }
        
        if let activeRight = right {
            rightAnchor.constraint(equalTo: activeRight, constant: -paddingRight).isActive = true
        }
        
        if let activeWidth = width {
            widthAnchor.constraint(equalToConstant: activeWidth).isActive = true
        }
        
        if let activeHeight = height {
            heightAnchor.constraint(equalToConstant: activeHeight).isActive = true
        }
        
        if let activeCenterX = centerX {
            centerXAnchor.constraint(equalTo: activeCenterX).isActive = true
        }
        
        if let activeCenterY = centerY {
            centerYAnchor.constraint(equalTo: activeCenterY).isActive = true
        }
    }
}
