//
//  Item.swift
//  Homepwner
//
//  Created by Robert Hieger on 3/3/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

/**********************************************************
 *                                                        *
 * The Item class defines the structure of the random     *
 * items that will appear in the instances of             *
 * UITableViewCell that will occur in the UITableView.    *
 *                                                        *
 **********************************************************
*/

class Item: NSObject {
    
    // NOTE: This class inherits from the Swift (Objective-C)
    //       root class--NSObject.
    
    
    // PROPERTIES:
    
              var name: String      // Name of Item
    var valueInDollars: Int         // Dollar Value of Item
      var serialNumber: String?     // Optional Serial Number
       let dateCreated: NSDate      // Time Stamp of Item Creation
    
    
    // DESIGNATED INITIALIZER:
    
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = NSDate()
        
        // Call super implementation of NSObject.init:
        
        super.init()
        
    }   // end init() -- designated initializer
    
}   // end class Item: NSObject