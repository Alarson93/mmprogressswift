//
//  NSBundle+MMProgressSwift.swift
//  Pods
//
//  Created by Alexander Larson on 8/29/16.
//
//

import Foundation

public extension NSBundle {
    
    class func podBundle() -> NSBundle {
        var bundlePath = NSBundle.mainBundle().pathForResource("MMProgressSwift", ofType: "bundle", inDirectory: "Frameworks/MMProgressSwift.framework")
        
        if (bundlePath == nil)
        {
            bundlePath = NSBundle.mainBundle().pathForResource("MMProgressSwift", ofType:"bundle")
        }
        
        //Force unwrapping. We are unable to create an NSBunde, we have major problems anyway.
        return NSBundle(path: bundlePath ?? "")!
    }
}

