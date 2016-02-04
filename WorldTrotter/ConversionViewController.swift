//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Robert Hieger on 2/4/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

class ConvsionViewController: UIViewController {
    
    // IBOutlet for Celsius temperature UILabel:
    
    @IBOutlet var celsiusLabel: UILabel!
    
    // IBAction to attach to Fahrenheit Text Field:
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        // Change the text appearing in the UILabel:
        
        celsiusLabel.text = textField.text
        
    }   // end fahrenheitFieldEditingChanged(textField: UITextField)
    
}   // end ConversionViewController: UIViewController