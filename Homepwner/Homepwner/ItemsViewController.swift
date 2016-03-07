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
    
    //IBACTIONS:
    
    @IBAction func addNewItem(sender: AnyObject)    {
        
        // Instantiate a new Item and add it to ItemStore.
        
        let newItem = itemStore.createItem()
        
        // Figure out where that item is in the array.
        
        if let index = itemStore.allItems.indexOf(newItem)  {
            
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            
            // Insert this new row into the table.
            
            tableView.insertRowsAtIndexPaths([indexPath],
                withRowAnimation: .Automatic)
            
        }   // end if
    
    }   // end addNewItem(sender: AnyObject)
    
    
    @IBAction func toggleEditingMode(sender: AnyObject) {
        
        // If you are currently in editing mode...
        
        if editing  {
            
            // Change text of button to inform user of state.
            
            // NOTE: This is the state of the button before it is tapped.
            
            sender.setTitle("Edit", forState: .Normal)
            
            // Turn off editing mode.
            
             setEditing(false, animated: true)
            
        }   else    {
            
            // Change text of button to inform user of state.
            
            // NOTE: This is the state of the button after it is tapped.
            
            sender.setTitle("Done", forState: .Normal)
            
            // Turn on editing mode.
            
            setEditing(true, animated: true)
            
        }   // end if-else
        
    }   // end toggleEditingMode(sender: AnyObject)
    
    
    // OVERRIDE BUILT-IN METHODS:
    
    // Override viewDidLoad().
    
    override func viewDidLoad() {
        
        // Call super impementation of viewDidLoad().
        
        super.viewDidLoad()
        
        // Get the height of the status bar.
        
        let statusBarHeight =
        UIApplication.sharedApplication().statusBarFrame.height
        
        // Set the insets for the UITableView using statusBarHeight
        // for the top inset and 0 for all other insets.
        
        let insets = UIEdgeInsets(top: statusBarHeight,
                                 left: 0,
                               bottom: 0,
                                right: 0)
        
        // Set tableView content insets.
        
        tableView.contentInset = insets
        
        // Set tableView scroll indicator insets.
        
        tableView.scrollIndicatorInsets = insets
        
    }   // end viewDidLoad()
    
    
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
            
        // Get a reusable or new UITableViewCell.
        
        let cell =
        tableView.dequeueReusableCellWithIdentifier("UITableViewCell",
            forIndexPath: indexPath)
        
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
    
    // Override tableView(tableView: UITableView,
    //                    commitEditingStyle editingStyle:
    //                    UITableViewCellEditingStyle,
    //                    forRowAtIndexPath indexPath: NSIndexPath)
    
    override func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath)                    {
            
        // If the tableView is asking to commit a delete command...
            
        if editingStyle == .Delete  {
                
            // Specify the row for deletion.
            
            let item = itemStore.allItems[indexPath.row]
            
            // Remove the item from itemStore
            
            itemStore.removeItem(item)
                
        }   // end if
            
        // Also remove that row from table with an animation.
            
        tableView.deleteRowsAtIndexPaths([indexPath],
            withRowAnimation: .Automatic)
            
    }   // end (_:commitEditingStyle...:)
    
    // Override (_:moveRowAtIndexPath...toIndexPath:).
    
    override func tableView(tableView: UITableView,
        moveRowAtIndexPath sourceIndexPath: NSIndexPath,
        toIndexPath destinationIndexPath: NSIndexPath) {
            
        // Update the model.
            
        itemStore.moveItemAtIndex(sourceIndexPath.row,
            toIndex: destinationIndexPath.row)
            
    }   // end override (_:moveRowAtIndexPath...toIndexPath:)
    
}   //  end ItemsViewController
