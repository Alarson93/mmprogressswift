//
//  MMProgress.swift
//  Pods
//
//  Created by Alexander Larson on 3/21/16.
//
//

import Foundation

public class MMProgress : UIView {
    
    //Constraints
    @IBOutlet weak var animationViewWidth: NSLayoutConstraint!
    @IBOutlet weak var animationViewHeight: NSLayoutConstraint!
    @IBOutlet weak var hudStackView: UIStackView!
    
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var statusLabel: TOMSMorphingLabel!
}

