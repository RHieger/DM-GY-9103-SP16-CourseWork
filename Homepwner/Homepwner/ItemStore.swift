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
    
    // Instantiate NSURL object for file to contain
    // persisted data in Homepwner.
    
    let itemArchiveURL: NSURL = {
        
        let documentsDirectories =
        NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory,
                                                inDomains: .UserDomainMask)
        
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory.URLByAppendingPathComponent("items.archive")
        
    }() // end itemArchiveURL
    
    
    // MARK: -  Built-In Method Overrides
    
    init()  {
        
        // Load persisted Item objects at application launch.
        
        if let archivedItems =
        NSKeyedUnarchiver.unarchiveObjectWithFile(itemArchiveURL.path!)
            as? [Item]  {
            
            allItems += archivedItems
            
        }   // end [Item]
        
    }   // end init()
    
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
    
    // Save changes to persistent archive file.
    
    func saveChanges() -> Bool {
        
        // Print debug information to console.
        
        print("Saving items to \(itemArchiveURL.path).")
        
        // Now actually save the objects to file.
        
        return NSKeyedArchiver.archiveRootObject(allItems,
                                            toFile: itemArchiveURL.path!)
        
    }   // end saveChanges()
    
}   // end ItemStore
