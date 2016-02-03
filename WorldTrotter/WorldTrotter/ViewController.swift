//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Robert Hieger on 1/31/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        // Call the superclass we wish to override.
        
        super.viewDidLoad()
        
        
        // Build first frame view from a CGRect.
        
        let firstFrame =
        CGRect(x: 160, y: 240, width: 100, height: 150)
        
        // Create superview to contain CGRect.
        
        let firstView = UIView(frame: firstFrame)
        
        // Set color for firstFrame.
        
        firstView.backgroundColor = UIColor.blueColor()
        
        // Add subview to UIView.
        
        view.addSubview(firstView)
        
        // Build another frame view from a CGRect.
        
        let secondFrame =
        CGRect(x: 20, y: 30, width: 50, height: 50)
        
        // Create superview to contatin CGRect
        
        let secondView = UIView(frame: secondFrame)
        
        // Set color for secondFrame CGRect.
        
        secondView.backgroundColor = UIColor.greenColor()
        
        // Add secondView to firstView subview.
        
        firstView.addSubview(secondView)
        
    }   // end viewDidLoad()

}   // end ViewController: UIViewController

