//
//  ViewController.swift
//  MMProgressSwift
//
//  Created by Alex Larson on 03/21/2016.
//  Copyright (c) 2016 Alex Larson. All rights reserved.
//

import UIKit
import MMProgressSwift

class ViewController: UIViewController {
    @IBOutlet weak var orangeImageView: UIImageView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func hudWithTimer(sender: AnyObject) {
        MMProgress.show("Loading data...")
        MMProgress.dismiss()
        MMProgress.show("More data")
        
//        [NSTimer scheduledTimerWithTimeInterval:3.0
//        target:self
//        selector:@selector(dismissProgress)
//        userInfo:nil
//        repeats:NO];
        //
        //    [NSTimer scheduledTimerWithTimeInterval:7
        //                                     target:self
        //                                   selector:@selector(presentHUD3)
        //                                   userInfo:nil
        //                                    repeats:NO];
        //
        //    [NSTimer scheduledTimerWithTimeInterval:6
        //                                     target:self
        //                                   selector:@selector(presentHUD2)
        //                                   userInfo:nil
        //                                    repeats:NO];
        //
        //    [NSTimer scheduledTimerWithTimeInterval:5.0
        //                                     target:self
        //                                   selector:@selector(presentHUD)
        //                                   userInfo:nil
        //                                    repeats:NO];
    }
    
    func dismissProgress()
    {
        MMProgress.dismiss()
    }
    
    func presentHUD()
    {
        MMProgress.show("asdf")
    }
    
    func presentHUD2()
    {
        MMProgress.show("And more data!")
    }
    
    func presentHUD3()
    {
        MMProgress.show("Custom view!")
        //     [MMProgress showWithStatus:@"Custom view!" onView:self.orangeImageView];
    }
}

