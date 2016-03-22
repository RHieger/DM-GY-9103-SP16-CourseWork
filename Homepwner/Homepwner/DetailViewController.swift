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

class DetailViewController: UIViewController, UITextFieldDelegate,
                            UINavigationControllerDelegate,
                            UIImagePickerControllerDelegate {
    
    // NOTE: The UITextFieldDelegate Protocol is applied in order
    //       to enable text field resignation of FirstResponder
    //       status. In plain English, this means that the text
    //       field is given the ability to control the keyboard,
    //       e.g. dismissing the keyboard when Return key is tapped
    //       or user taps anywhere on view outside of keyboard.
    
    // IBOUTLETS:
    
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var serialNumberField: UITextField!
    
    @IBOutlet var valueField: UITextField!
    
    @IBOutlet var dateLabel: UILabel!
    
    
    @IBOutlet var imageView: UIImageView!
    
    
     // IBACTIONS:
    
    @IBAction func backgroundTapped(sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }   // end func backgroundTapped(sender: UITapGestureRecognizer)
 
    @IBAction func takePicture(sender: UIBarButtonItem) {
        
        // Instantiate UIImagePickerController object.
        
        let imagePicker = UIImagePickerController()
        
        // If the device has a camera, take a picture; otherwise
        // just pick from a photo library.
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            
            // Set the source type to .Camera.
            
            imagePicker.sourceType = .Camera
            
        }   else    {
            
            // If device has no camera, choose photo from
            // photo library.
            
            imagePicker.sourceType = .PhotoLibrary
            
        }   // end if-else
        
        // Set this instance instance of UIImagePickerController()
        // to be the delegate.
        
        imagePicker.delegate = self
        
        // Place imagePicker in stack view modally.
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }   // end takePicture(sender: UIBarButtonItem)
    
    // PROPERTIES:
    
    // Instantiate Item object.
    
    var item: Item! {
        
        // Property Observer to Update title of navigationItem:
        
        didSet  {
            
            navigationItem.title = item.name
            
        }   // end didSet
        
    }   // end item
    
    // Instantiate an ImageStore object:
    
    var imageStore: ImageStore!
    
    // Instantiate NSNumberFormatter object.
    
    let numberFormatter: NSNumberFormatter = {
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
        
    }()   // end numberFormatter
    
    
    // Instantiate NSDateFormatter object.
    
    let dateFormatter: NSDateFormatter = {
        
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
    
    
    // Override viewWillDisappear(_:).
    
    override func viewWillDisappear(animated: Bool) {
        
        // Call super implementation of viewWillDisappear(_:).
        
        super.viewWillDisappear(animated)
        
        // If back button is tapped, clear firstResponder.
        
        view.endEditing(true)
        
        // Update item values.
        
        // If nameField.text is nil, apply default value:
        
        item.name = nameField.text ?? ""
        
        // Update serial number if changed.
        
        item.serialNumber = serialNumberField.text
        
        // Update item price if it has changed.
        
        if let valueText = valueField.text,
            value = numberFormatter.numberFromString(valueText) {
                
                item.valueInDollars = value.integerValue
                
        }   else    {
            
            item.valueInDollars = 0
            
        }   // end if-else
        
    }   // end viewWillDisappear(_:)
    
    
    // METHODS:
    
    // textFieldShouldReturn(_:) Method (belongs to the
    // UITextFieldDelegate protocol.
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // Resign FirstResponder status on text field.
        
        textField.resignFirstResponder()
        
        // Return resignFirstResponder status as true.
        
        return true
        
    }   // end textFieldShouldReturn(_:)
    
    // Implement (_:didFinishPickingMediaWithInfo:)
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // Get picked image from info dictionary.
        
        let image =
        info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Put that image on the screen in the imageView.
        
        imageView.image = image
        
        // Take imagePicker off the screen--
        // you must call this dismiss method:
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }   // end (_:didFinishPickingMediaWithInfo:)
    
}   // end DetailViewController
