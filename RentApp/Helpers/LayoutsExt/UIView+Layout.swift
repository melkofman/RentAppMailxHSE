//
//  UIView+Layout.swift
//  RentApp
//
//  Created by Melanie Kofman on 03.01.2021.
//

import UIKit

extension NSLayoutConstraint {
    func activated() -> NSLayoutConstraint {
        self.isActive = true
        return self
    }
}

extension UIView {
    @discardableResult
    func bottom(_ constant: CGFloat = 0.0) -> NSLayoutConstraint {
        self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor, constant: constant).activated()
    }
}

