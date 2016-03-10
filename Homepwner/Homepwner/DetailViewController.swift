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
    
}   // end DetailViewController
