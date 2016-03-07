//
//  ItemSectionsData.swift
//  HomepwnerBronze9
//
//  Created by Robert Hieger on 3/6/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

/*********************************************************
 *                                                       *
 * ItemSectionsData.swift:                               *
 *                                                       *
 * This class defines the data to be shown in the two    *
 * tableView sections specified below. The object of     *
 * this class is to call the 5 randomItems generated     *
 * by the ItemStore class and display them either under  *
 * the "Items Worth More Than $50" section or the        *
 * "Items Worth Less Than $50" section.                  *
 *                                                       *
 *********************************************************
*/

class ItemSectionsData  {
    
    func getSectionsFromData() -> [ItemSection] {
    
        // Declare array of itemSection objects:
    
        var itemSectionArray = [ItemSection]()
    
        // Declare struct for Items Worth More Than $50:
    
        let greaterThan50 = ItemSection(title: "Items Worth More Than $50")
    
        // Declare struct for Items Worth Less Than $50:
    
        let lessThan50 = ItemSection(title: "Items Worth Less Than $50")
    
        // Add each struct to itemSectionArray.
        
        itemSectionArray.append(greaterThan50)
        
        itemSectionArray.append(lessThan50)
        
        // Return itemSectionArray to calling method.
        
        return itemSectionArray
    
    }
    
}   // end ItemSectionsData
