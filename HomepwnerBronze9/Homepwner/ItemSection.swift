//
//  ItemSection.swift
//  HomepwnerBronze9
//
//  Created by Robert Hieger on 3/6/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

/**********************************************************
 *                                                        *
 * itemSectionsData.swift:                                *
 *                                                        *
 * This program module contains a struct that defines     *
 * the structure of sections for the ItemsViewController  *
 * UITableView.                                           *
 *                                                        *
 **********************************************************
*/

struct ItemSection {
    
    var head: String                // Header for table section
    var randomItems: [String]       // Item beneath header
    
    // Initialize all properties:
    
    init( title: String, objects: [String] )    {
        
        head = title
        randomItems = objects
        
    }   // end init()
    
}   // end struct itemSection
