//
//  ColorUtility.swift
//  FoodParty
//
//  Created by Heguang Miao on 19/03/2016.
//  Copyright © 2016 CB Akatsuki. All rights reserved.
//

import UIKit

class ColorUtility {
    class func generateOnePixelImageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        if let context = context {
            context.setFillColor(color.cgColor)
            context.fill(rect)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return (image != nil) ? image! : UIImage()
        }
        return UIImage()
    }
    
}

extension UIColor {
    convenience init(rgb: UInt, alpha: CGFloat) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    var hexString:String {
        get {
            let components = self.cgColor.components!
            let r = Float(components[0])
            let g = Float(components[1])
            let b = Float(components[2])
            return String(format: "#%02lX%02lX%02lX", arguments: [lroundf(r * 255.0),lroundf(g * 255.0),lroundf(b * 255.0)])
        }
    }
}
