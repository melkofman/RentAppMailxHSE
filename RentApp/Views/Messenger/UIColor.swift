//
//  UIColor.swift
//  chatt
//
//  Created by Melanie Kofman on 06.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
    {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}

extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(displayP3Red: r / 255, green: g / 255, blue: b / 255, alpha: 1)
    }
}
