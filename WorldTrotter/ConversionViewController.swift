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
    
    // IBOutlet for Fahrenheit Text Field:
    
    @IBOutlet var textField: UITextField!
    
    // IBAction to attach to Fahrenheit Text Field:
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        // Change the text appearing in the UILabel while
        // allowing for the text being empty prior to user
        // input in the Fahrenheit text field.
        
        if let text = textField.text where !text.isEmpty    {
            
            celsiusLabel.text = textField.text
            
        }   else    {
            
            celsiusLabel.text = "???"
            
        }   // end if-else
        
    }   // end fahrenheitFieldEditingChanged(textField: UITextField)
    
    // dismissKeyBoard Action (class method):
    
    @IBAction func dismissKeyboard(sender: AnyObject)   {
        
        // Force textField to relinquish firstResponder status.
        
        textField.resignFirstResponder()
        
    }   // end dismissKeyboard(sender: AnyObject)
    
}   // end ConversionViewController: UIViewController