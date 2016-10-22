//
//  UIImage+Rotation.swift
//  MobyClip
//
//  Created by Heguang Miao on 5/09/2016.
//  Copyright © 2016 The University of Melbourne. All rights reserved.
//

// https://ruigomes.me/blog/how-to-rotate-an-uiimage-using-swift/

import UIKit

extension UIImage {
    public func imageRotatedByDegrees(degrees: CGFloat) -> UIImage {
        
        let degreesToRadians: (CGFloat) -> CGFloat = {
            return $0 / 180.0 * CGFloat(M_PI)
        }
        
        // calculate the size of the rotated view's containing box for our drawing space
        var rotatedViewBox = CGRect(origin: CGPoint(), size: size)
        let t = CGAffineTransform(rotationAngle: degreesToRadians(degrees));
        rotatedViewBox = rotatedViewBox.applying(t)
        let rotatedSize = rotatedViewBox.size
        
        
        // Create the bitmap context
        UIGraphicsBeginImageContextWithOptions(rotatedSize, false, self.scale)
        let bitmap = UIGraphicsGetCurrentContext()!
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        bitmap.translateBy(x: rotatedSize.width / 2.0, y: rotatedSize.height / 2.0);
        
        // Rotate the image context
        bitmap.rotate(by: degreesToRadians(degrees));
        
        
        self.draw(at: CGPoint(x: -size.width / 2, y: -size.height / 2))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
