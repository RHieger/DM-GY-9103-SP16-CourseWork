//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Robert Hieger on 2/17/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    // IBOutlets AND IBActions:
    
    // Declare IBOutlet for Celsius Temperature Text Label.
    
    @IBOutlet var celsiusLabel: UILabel!
    
    // Declare IBOutlet for Farhenheit Temparature Text Field.
    
    @IBOutlet var textField: UITextField!
    
    // Declare IBAction on textField to Dismiss the Keyboard.
    
    @IBAction func dismissKeyBoard(sender: AnyObject) {
        
        // Dismiss the keyboard by resigning First Responder status.
        
        textField.resignFirstResponder()
        
    }   // end dismissKeyBoard(sender: AnyObject)
    
    // Declare IBAction for celsiusLabel.
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        // Set the text of celsiusLabel according to the edit
        // passed through as textField.
        
        if let text = textField.text, value = Double(text) {
            
            fahrenheitValue = value
            
        }   else    {
            
            fahrenheitValue = nil
            
        }   // end if-else
        
    }   // end fahrenheitFieldEditingChanged(textField: UITextField)
    
    // PROPERTIES:
    
    // User input of Fahrenheit temp
    
    var fahrenheitValue: Double?    {
        
        // Declare property observer to call
        // updateCelsiusLabel().
        
        didSet {
            
            // call updateCelsiusLabel()
            
            updateCelsiusLabel()
            
        }   // end didSet
        
    }   // end fahrenheitValue: Double?
    
    // Computed Property for Celsius temparature equivalent:
    
    var celsiusValue: Double?   {
        
        // Compute value for Celsius Temperature.
        
        if let value = fahrenheitValue {
            
            // Return converted Fahrenheit value.
            
            return (value - 32) * (5 / 9)
            
        }   else    {
            
            // Return nil value.
            
            return nil
            
        }   // end if-else
        
    }   // end calculated celsiusValue: Double?
    
    // METHODS:
    
    // Override func viewDidLoad() to print message to console.
    
    override func viewDidLoad() {
        
        // Call super implementation of viewDidLoad() method.
        
        super.viewDidLoad()
        
        // Print message to console when ConversionView loads.
        
        print("ConversionViewController loaded its view.")
        
    }   // end override func viewDidLoad()
    
    // Declare Method to update the Celsius Temperature Label.
    
    // First create NumberFormatter to specify only 1 decimal
    // place for converted Celsius value
    
    let numberFormatter: NSNumberFormatter =
    {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func updateCelsiusLabel()   {
        
        if let value = celsiusValue {
            
            // Update celsiusLabel with converted value.
            
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
            
        }   else    {
            
            // Update celsiusLabel with "???" string if nil.
            
            celsiusLabel.text = "???"
            
        }   // end if-else
        
    }   // end updatedCelsiusLabel()
    
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool       {
            
            // Declare constants to represent current and
            // replacement text.
            
            let existingTextHasDecimalSeparator =
            textField.text?.rangeOfString(".")
            
            let replacementTextHasDecimalSeparator =
            string.rangeOfString(".")
            
            // Test that "." is not present both in contents of
            // textField.text and textField.string (the replace-
            // ment string of text. If it is, this would indicate
            // a second decimal point, and the user input should
            // be disallowed.
            
            if existingTextHasDecimalSeparator != nil &&
                replacementTextHasDecimalSeparator != nil       {
                    
                return false
                    
            }   else    {
                
                    return true
                
            }   // end if-else
        
    }   // end func textField
    
}   // end ConversionViewController