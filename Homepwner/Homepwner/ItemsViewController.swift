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
    
    // MARK: - Properties
    
    var itemStore: ItemStore!       // Instantiate ItemStore object.
    var imageStore: ImageStore!     // Instnatiate ImageStore object.
    
    // MARK: - @IBActions
    
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
    
    
    // MARK: - Override Built-In Methods
    
    // Override viewDidLoad().
    
    override func viewDidLoad() {
        
        // Call super impementation of viewDidLoad().
        
        super.viewDidLoad()
        
        // Set the height of table rows.
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Now set an estimated height for the table rows.
        
        tableView.estimatedRowHeight = 65
        
    }   // end viewDidLoad()
    
    
    // Override init(_:coder:).
    
    required init?(coder aDecoder: NSCoder) {
        
        // Call the super implementation of init?(coder aDecoder: NSCoder).
        
        super.init(coder: aDecoder)
        
        // Add edit button to left of navigation bar.
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
    }   // end func init?(coder aDecoder: NSCoder)
    
    
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
        tableView.dequeueReusableCellWithIdentifier("ItemCell",
            forIndexPath: indexPath) as! ItemCell
        
        // Update table cell view with user-specified
        // accessibility options.
        
        cell.updateLabels()     // Remember cell is instance of ItemCell
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear on the tableView.
                    
        let item = itemStore.allItems[indexPath.row]
                    
        // Configure the cell with item
        
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber   // Serial Number
        cell.valueLabel.text = "$\(item.valueInDollars)"  // Price
        
        // Now choose the color for valueInDollars. If value
        // is over $50, text should be red. Otherwise, text
        // should be red.
        
        if item.valueInDollars > 50 {
            
            cell.valueLabel.textColor = UIColor.redColor()
            
        }   else    {
            
            cell.valueLabel.textColor = UIColor.greenColor()
            
        }   // end if-else
                    
        // Return cell to calling method.
                    
        return cell
            
    }   // end tableView(_:cellForRowAtIndexPath:)
    
    // Override (_:titleForDeleteConfirmationButtonForRowAtIndexPath:).
    
    // FULL DISCLOSURE: For this method, I am indebted to a Stack Overflow
    //                  article at the following URL:
    //
    // http://stackoverflow.com/questions/7394988/how-to-change-uitableview-delete-button-text
    
    // NOTE: This implementation goes beyond the requirements of the
    //       Bronze Challenge, customizing both the button and title
    //       text of the Action Alert, and changes the text displayed
    //       by the default delete button so that it reads "Remove."
    //       I chose to do this so that wording was consistent all the
    //       way across the deletion action and the Action Alert.
    
    override func tableView(tableView: UITableView,
        titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "Remove"
    }
    
    
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
            
            // Configure .ActionSheet style alert to confirm
            // that user wishes to delete the selected row
            // from the table.
            
            let title = "Remove \(item.name)"   // Alert title
            
            // Alert message:
            
            let message = "Are you sure you want to remove this item?"
            
            // Configure alert:
            
            let ac = UIAlertController(title: title,
                message: message, preferredStyle: .ActionSheet)
            
            // Define cancellation action:
            
            let cancelAction = UIAlertAction(title: "Cancel",
                style: .Cancel,
                handler: nil)
            
            // Add cancelAction to Alert Controller.
            
            ac.addAction(cancelAction)
            
            // Define delete action:
            
            let deleteAction = UIAlertAction(title: "Remove",
                style: .Destructive,
                handler: {
                    
                    (action) -> Void in
                    
                    // Remove the item from itemStore.
                    
                    self.itemStore.removeItem(item)
                    
                    // Remove item's image from imageStore.
                    
                    self.imageStore.deleteImageForKey(item.itemKey)
                    
                    // Also remove that row from table with an animation.
                    
                    tableView.deleteRowsAtIndexPaths([indexPath],
                        withRowAnimation: .Automatic)
                    
            })  // end deleteAction
            
            // Add deleteAction to Alert Controller.
            
            ac.addAction(deleteAction)
            
            // Display modal alert:
            
            presentViewController(ac, animated: true, completion: nil)
            
        }   // end if
            
    }   // end (_:commitEditingStyle...:)
    

    // Override (_:moveRowAtIndexPath...toIndexPath:).
    
    override func tableView(tableView: UITableView,
        moveRowAtIndexPath sourceIndexPath: NSIndexPath,
        toIndexPath destinationIndexPath: NSIndexPath) {
            
        // Update the model.
            
        itemStore.moveItemAtIndex(sourceIndexPath.row,
            toIndex: destinationIndexPath.row)
            
    }   // end override (_:moveRowAtIndexPath...toIndexPath:)
    
    
    // Override prepareForSegue(_:sender:).
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
        
    {
        
        // If triggered segue is ShowItem Segue...
        
        if segue.identifier == "ShowItem"   {
            
            // Figure out which row was tapped.
            
            if let row = tableView.indexPathForSelectedRow?.row {
                
                // Get item asscoiated with row and pass to Detail View.
                
                let item = itemStore.allItems[row]
                
                let detailViewController =
                segue.destinationViewController as! DetailViewController
                
                detailViewController.item = item
                
                // Set the imageStore object.
                
                detailViewController.imageStore = imageStore
                
            }   // end if
            
        }   // end if
        
    }   // end override func prepareForSegue(_:sender:)
    
    // Override viewWillAppear(_:).
    
    override func viewWillAppear(animated: Bool)    {
        
        // Call super implementation of viewWillAppear(_:).
        
        super.viewWillAppear(animated)
        
        // When user taps Back (<) button on navigation view,
        // update the values in the table cell of the
        // itemsViewController.
        
        tableView.reloadData()          // Refreshes view.
        
    }   // end override func viewWillAppear(_:)
    
}   //  end ItemsViewController
