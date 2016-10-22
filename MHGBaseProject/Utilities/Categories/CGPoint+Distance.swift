//
//  CGPoint+Distance.swift
//  FishRecognition
//
//  Created by Heguang Miao on 29/08/2016.
//  Copyright © 2016 The University of Melbourne. All rights reserved.
//

import UIKit

precedencegroup Distance {
    associativity: left
}

infix operator |<->| : Distance

func |<->| (left: CGPoint, right:CGPoint) -> CGFloat {
    let x1 = left.x
    let y1 = left.y
    let x2 = right.x
    let y2 = right.y
    let a = (x2-x1)*(x2-x1)
    let b = (y2-y1)*(y2-y1)
    let csquare = sqrt(a+b)
    return CGFloat(csquare)
}

extension CGPoint {
    static func boundingBox(points: [CGPoint]) -> CGRect {
        if points.count == 0 {
            return CGRect()
        }
        
        var minX = CGFloat(MAXFLOAT)
        var maxX = CGFloat(0)
        var minY = CGFloat(MAXFLOAT)
        var maxY = CGFloat(0)
        
        for point in points {
            if point.x < minX {
                minX = point.x
            }
            if point.x > maxX {
                maxX = point.x
            }
            if point.y < minY {
                minY = point.y
            }
            if point.y > maxY {
                maxY = point.y
            }
        }
        return CGRect(x: minX,
                      y: minY,
                      width: maxX - minX,
                      height: maxY - minY)
    }
}
