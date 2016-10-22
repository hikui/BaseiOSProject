//
//  CommonFunctions.swift
//  YoFlea
//
//  Created by Heguang Miao on 17/04/2016.
//  Copyright © 2016 YoFlea. All rights reserved.
//

import UIKit

func PromptErrorMessage(msg:String, viewController:UIViewController, callback:((UIAlertAction)->Void)?=nil) {
    let alert = UIAlertController(title: "Error", message: msg, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
        callback?(action)
    }))
    viewController.present(alert, animated: true, completion: nil)
}

func PromptMessage(title:String? = nil, msg:String, viewController:UIViewController, callback:((UIAlertAction)->Void)?=nil) {
    let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
        callback?(action)
    }))
    viewController.present(alert, animated: true, completion: nil)
}

func delay(delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: closure)
}


func SYSTEM_VERSION_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                          options: NSString.CompareOptions.numeric) == ComparisonResult.orderedSame
}

func SYSTEM_VERSION_GREATER_THAN(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                          options: NSString.CompareOptions.numeric) == ComparisonResult.orderedDescending
}

func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                          options: NSString.CompareOptions.numeric) != ComparisonResult.orderedAscending
}

func SYSTEM_VERSION_LESS_THAN(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                          options: NSString.CompareOptions.numeric) == ComparisonResult.orderedAscending
}

func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                          options: NSString.CompareOptions.numeric) != ComparisonResult.orderedDescending
}
