//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Robert Hieger on 3/9/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

/**********************************************************
 *                                                        *
 * DetailViewController Class:                            *
 *                                                        *
 * This class pulls data from a tapped tableViewCell      *
 * and displays them in in the Detail Stack View. This    *
 * controller also controls the transmission of this      *
 * data to the nested stack views.                        *
 *                                                        *
 **********************************************************
*/

class DetailViewController: UIViewController {
    
    // IBOUTLETS:
    
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var serialNumberField: UITextField!
    
    @IBOutlet var valueField: UITextField!
    
    @IBOutlet var dateLabel: UILabel!
    
    
    // PROPERTIES:
    
    var item: Item!         // Instantiate Item object.
    

    // Instantiate NSNumberFormatter object.
    
    var numberFormatter: NSNumberFormatter = {
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
        
    }()   // end numberFormatter
    
    
    // Instantiate NSDateFormatter object.
    
    var dateFormatter: NSDateFormatter = {
        
       let formatter = NSDateFormatter()
       formatter.dateStyle = .MediumStyle
       formatter.timeStyle = .NoStyle
        
       return formatter
        
    }()   // end dateFormatter
    
    
    // OVERRIDE BUILT-IN METHODS:
    
    // Override viewWillAppear(_:animated: Bool).
    
    override func viewWillAppear(animated: Bool) {
        
        // Call super implementation of viewWillAppear(animated).
        
        super.viewWillAppear(animated)
        
        // Set properties for item:
        
        nameField.text = item.name                      // Name
        serialNumberField.text = item.serialNumber      // Serial Number
        
        // Price of item
        
        valueField.text =
            numberFormatter.stringFromNumber(item.valueInDollars)
        
        // Time Stamp
        
        dateLabel.text =
        dateFormatter.stringFromDate(item.dateCreated)
        
    }   // end override func viewWillAppear(animated: Bool)
    
}   // end DetailViewController
