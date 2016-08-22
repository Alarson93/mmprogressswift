//
//  MMProgressConfiguration.swift
//  Pods
//
//  Created by Alexander Larson on 3/21/16.
//
//

import Foundation
import UIKit

public enum MMProgressBackgroundType: NSInteger
{
    case MMProgressBackgroundTypeBlurred = 0,
    MMProgressBackgroundTypeSolid
}

public class MMProgressConfiguration: NSObject {
    
    //Background
    public var backgroundColor: UIColor?
    public var backgroundType: MMProgressBackgroundType?
    public var backgroundEffect: UIVisualEffect?
    public var fullScreen: Bool?
    
    //Edges
    public var shadowEnabled: Bool?
    public var shadowOpacity: CGFloat?
    public var shadowColor: UIColor?
    
    public var borderEnabled: Bool?
    public var borderWidth: CGFloat?
    public var borderColor: UIColor?
    
    //Custom Animation
    public var loadingIndicator: UIView?
    
    //Presentation
    public var presentAnimated: Bool?
    
    //Status
    public var statusColor: UIColor?
    public var statusFont: UIFont?
    
    //Interaction
    public var tapBlock: Bool?
    
    override init() {
        //Background
        backgroundColor = UIColor.clearColor()
        backgroundType = MMProgressBackgroundType.MMProgressBackgroundTypeBlurred
        backgroundEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        fullScreen = false
        
        //Edges
        shadowEnabled = true
        shadowOpacity = 1
        shadowColor = UIColor.blackColor()
        
        borderEnabled = false
        borderWidth = 1
        borderColor = UIColor.blackColor()
        
        //Default Animation
        //loading
        
        //Presentation
        presentAnimated = true
        
        //Status
        statusColor = UIColor.darkGrayColor()
        statusFont = UIFont.systemFontOfSize(17)
        
        //Interaction
        tapBlock = true
    }
}
