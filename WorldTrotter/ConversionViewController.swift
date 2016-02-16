//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Robert Hieger on 2/4/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    // IBOutlet for Celsius temperature UILabel:
    
    @IBOutlet var celsiusLabel: UILabel!
    
    // Optional for value of Fahrenheit temperature:
    
    var fahrenheitValue: Double?    {
        
        didSet  {
            
            updateCelsiusLabel()
            
        }   // end didSet
        
    }   // end fahrenheitValue: Double?
    
    // Computed property for calculation of Celsius temperature:
    
    var celsiusValue: Double? {
    
        if let value = fahrenheitValue {
            
            return (value - 32) * 5 / 9
            
        }   else    {
            
            return nil
            
        }   // end if-else
    
    }   // end if let value = fahrenheitValue
    
    // IBOutlet for Fahrenheit Text Field:
    
    @IBOutlet var textField: UITextField!
    
    // IBAction to attach to Fahrenheit Text Field:
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        if let text = textField.text, value = Double(text)  {
            
            fahrenheitValue = value
            
        }   else    {
            
            fahrenheitValue = nil
            
        }   // end if-else
        
    }   // end fahrenheitFieldEditingChanged(textField: UITextField)
    
    // dismissKeyBoard Action (class method):
    
    @IBAction func dismissKeyboard(sender: AnyObject)   {
        
        // Force textField to relinquish firstResponder status.
        
        textField.resignFirstResponder()
        
    }   // end dismissKeyboard(sender: AnyObject)
    
    // Method to update the celsiusLabel to reflect a converted
    // Fahrenheit temperature:
    
    func updateCelsiusLabel()   {
        
        if let value = celsiusValue {
            
            celsiusLabel.text =
                NumberFormatter.stringFromNumber(value)
            
        }   else    {
            
            celsiusLabel.text = "???"
            
        }   // end if-lse
        
    }   // end updateCelsiusLabel()
    
    // Define a Number Formatter.
    
    let NumberFormatter: NSNumberFormatter =    {
        
        let nf = NSNumberFormatter()
        
        nf.numberStyle = .DecimalStyle
        
        nf.minimumFractionDigits = 0
        
        nf.maximumFractionDigits = 1
        
        return nf
        
    }()   // end NumberFormatter
    
    // Implement textField(_:shouldChangeCharactersInRange:replacementString:).
    
    func textField(textField: UITextField, shouldChangeCharactersInRange
        range: NSRange, replacementString string: String) -> Bool {
        
        print( "Current text: \(textField.text)" )
            
        print( "Replacement text: \(string)" )
            
        return true
            
    }
    
    // Override func viewDidLoad()
    
    override func viewDidLoad() {
        
        // Always call the super implementation of viewDidLoad()
        
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
        
    }
    
}   // end ConversionViewController: UIViewController