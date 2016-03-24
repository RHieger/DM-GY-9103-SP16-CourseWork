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
    
    // MARK: - Properties
    
     var allItems = [Item]()        // Array of Item instances
    
    
    // MARK: - Methods
    
    func createItem() -> Item   {
        
        // Instantiate item object.
        
        let newItem = Item(random: true)
        
        // Add newItem to allItems array.
        
        allItems.append(newItem)
        
        // Return newItem to calling method.
        
        return newItem
        
    }   // end createItem() -> Item
    
    
    func removeItem(item: Item)     {
        
        if let index = allItems.indexOf(item)   {
            
            allItems.removeAtIndex(index)
            
        }   // end removeItem(item: Item)
        
    }   // end removeItem(Item: item)
    
    func moveItemAtIndex(fromIndex: Int, toIndex: Int)  {
        
        // If fromIndex and toIndex are equal to one another,
        // that is, if the move has already taken place,
        // do nothing.
        
        if fromIndex == toIndex {
            
            return
            
        }   // end if
        
        // Temporarily store row at fromIndex to movedItem
        // so that it may be referenced in the move.
        
        let movedItem = allItems[fromIndex]
        
        // Now delete item at fromIndex from allItems array.
        
        allItems.removeAtIndex(fromIndex)
        
        // Insert movedItem at new location.
        
        allItems.insert(movedItem, atIndex: toIndex)
        
    }   // end moveItemAtIndex(fromIndex: Int, toIndex: Int)
    
}   // end ItemStore
