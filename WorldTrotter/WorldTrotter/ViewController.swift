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
        
        // Bind firstFrame to UIView.
        
        let firstView = UIView(frame: firstFrame)
        
        // Set color for firstFrame.
        
        firstView.backgroundColor = UIColor.blueColor()
        
        // Add subview to UIView.
        
        view.addSubview(firstView)
        
    }   // end viewDidLoad()

}   // end ViewController: UIViewController

