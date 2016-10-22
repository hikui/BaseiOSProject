//
//  String+DrawingSize.swift
//  MobyClip
//
//  Created by Heguang Miao on 6/09/2016.
//  Copyright © 2016 The University of Melbourne. All rights reserved.
//

import UIKit

extension String {
    func drawingSize(boundingSize: CGSize, attributes: [String : AnyObject]) -> CGSize {
        let stringCopy = self as NSString
        var targetSize = stringCopy.boundingRect(with: boundingSize, options: .usesLineFragmentOrigin, attributes: attributes, context: nil).size
        targetSize.height = ceil(targetSize.height)
        targetSize.width = ceil(targetSize.width)
        return targetSize
    }
}
