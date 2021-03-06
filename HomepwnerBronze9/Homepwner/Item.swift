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
    
    
    // CONVENIENCE INITIALIZER:
    
    convenience init(random: Bool = false) {
        
        // This initializer creates a randomly generated item
        // for placement in UITableViewCell instances in the
        // UITableView.
        
        if random   {
            
            // Declare String array constant to hold adjectives:
            
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            
            // Declare String array constant to hold nouns:
            
            let nouns = ["Bear", "Spork", "Mac"]
            
            // Set array index for randomly selected adjectives
            // array element:
            
            var idx = arc4random_uniform( UInt32(adjectives.count) )
            
            // Set content of adjective to random index of the
            // adjectives array specifed by idx.
            
            let randomAdjective = adjectives[ Int(idx) ]
            
            // Set array index for randomly selected nouns array element:
            
            idx = arc4random_uniform( UInt32(nouns.count) )
            
            // Set content of adjective to random index of the
            // nouns array specified by idx.
            
            let randomNoun = nouns[ Int(idx) ]
            
            // Set the name of the item to the concatenation of
            // the text content in randomAdjective and randomNoun:
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            
            // Set the dollar value of the item to a random value
            // between 0 and 99.
            
            let randomValue = Int( arc4random_uniform(100) )
            
            // Generate a random Serial Number for item:
            
            let randomSerialNumber =
            NSUUID().UUIDString.componentsSeparatedByString("-").first!
            
            // Now initialize the values:
            
            self.init(name: randomName,
              serialNumber: randomSerialNumber,
            valueInDollars: randomValue)
            
        }   else    {
            
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
            
        }   // end if-else
        
    }   // end convenience init()
    
}   // end class Item: NSObject