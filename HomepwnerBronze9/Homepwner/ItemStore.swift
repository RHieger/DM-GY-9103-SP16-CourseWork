//
//  ItemStore.swift
//  Homepwner
//
//  Created by Robert Hieger on 3/3/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

/********************************************************
 *                                                      *
 * The ItemStore class encapsulates the instantiation   *
 * of an array of Item class instances.                 *
 *                                                      *
 ********************************************************
*/

class ItemStore {
    
    // PROPERTIES:
    
     var allItems = [Item]()        // Array of Item instances
    
    
    // METHODS:
    
    func createItem() -> Item   {
        
        // Instantiate item object.
        
        let newItem = Item(random: true)
        
        // Add newItem to allItems array.
        
        allItems.append(newItem)
        
        // Return newItem to calling method.
        
        return newItem
        
    }   // end createItem() -> Item
    
    
    // DESIGNATED INITIALIZER:
    
    init()  {
        
        for _ in 0..<5 {
            
            // Instantiate 5 Item objects.
            
            createItem()
            
        }   // end for _ in
        
    }
    
}   // end ItemStore
