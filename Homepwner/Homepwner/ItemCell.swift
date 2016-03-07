//
//  ItemCell.swift
//  Homepwner
//
//  Created by Robert Hieger on 3/7/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

/************************************************************
 *                                                          *
 * ItemCell.swift:                                          *
 *                                                          *
 * The ItemCell class provides a detail view for an         *
 * individual tableViewCell. By adding views to its         *
 * contentView object, we will display a detail view that   *
 * includes the Item name, its price and its serial number. *
 *                                                          *
 ************************************************************
*/

class ItemCell: UITableViewCell {
    
    // IBOUTLETS:
    
    @IBOutlet var nameLabel: UILabel!               // Name of Item
    @IBOutlet var serialNumberLabel: UILabel!       // Serial Number
    @IBOutlet var valueLabel: UILabel!              // Price of Item
    
}   // end ItemCell: UITableViewCell