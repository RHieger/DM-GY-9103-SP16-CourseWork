//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Robert Hieger on 3/3/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

/*********************************************************
 *                                                       *
 * The ItemsViewController class will control a table    *
 * view that pulls data from a data store into the       *
 * UITableViewCell objects that are part of its view.    *
 *                                                       *
 *********************************************************
*/

class ItemsViewController: UITableViewController {
    
    // PROPERTIES:
    
    var itemStore: ItemStore!   // Instantiate ItemStore object.
    
    
    // METHODS:
    
    // Override tableView(tableView: UITableView,
    //                    numberOfRowsInSection section: Int) -> Int
    
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int      {
            
            // Return the number of table rows needed
            // to contain items.
            
            // NOTE: This method is required by UITableViewController.
            
            return itemStore.allItems.count
            
    }   // end override tableView(...)
    
    
    // Override tableView(_:cellForRowAtIndexPath:).
    
    override func tableView(tableView: UITableView,
      cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell  {
            
        // Instantiate UITableViewCell object with default style.
                    
        let cell = UITableViewCell(style: .Value1,
                         reuseIdentifier: "UITableViewCell")
                    
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear on the tableView.
                    
        let item = itemStore.allItems[indexPath.row]
                    
        // Set the text content of the item name.
                    
        cell.textLabel?.text = item.name
                    
        // Set the text content of the item dollar value.
                    
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
                    
        // Return cell to calling method.
                    
        return cell
            
    }   // end tableView(_:cellForRowAtIndexPath:)
    
}   //  end ItemsViewController