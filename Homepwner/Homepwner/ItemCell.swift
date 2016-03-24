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
    
    // MARK: - @IBOutlets
    
    @IBOutlet var nameLabel: UILabel!               // Name of Item
    @IBOutlet var serialNumberLabel: UILabel!       // Serial Number
    @IBOutlet var valueLabel: UILabel!              // Price of Item
    
    
    // MARK: - Methods
    
    func updateLabels() {
        
        // This method responds to user request in settings
        // for preferred text size.
        
        // Provide a handle for bodyFont style.
        
        let bodyFont =
        UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        
        // Set name and value labels with bodyFont styling.
        
        nameLabel.font = bodyFont
        
        valueLabel.font = bodyFont
        
        
        // Provide a handle for Caption1 style.
        
        let caption1Font =
        UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        
        // Set serial number label styling.
        
        serialNumberLabel.font = caption1Font
        
    }   // end updateLabels()
    
}   // end ItemCell: UITableViewCell