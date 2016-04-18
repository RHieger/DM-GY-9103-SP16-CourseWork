//
//  Photo.swift
//  Photorama
//
//  Created by Robert Hieger on 4/18/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

/**************************************************************
 *                                                            *
 * Photo Class:                                               *
 *                                                            *
 * This class defines the structure and initializes photo     *
 * objects specified in the JSON data returned from the       *
 * PhotoStore class.                                          *
 *                                                            *
 **************************************************************
*/

import Foundation

class Photo {
    
    // MARK: - Properties
    
    let title: String           // Title of Photo
    let remoteURL: NSURL        // Flickr URL for Photo
    let photoID: String         // Photo ID
    let dateTaken: NSDate       // Date Photo Taken
    
    
    // MARK: - Designated Initializer
    
    init(title: String, remoteURL: NSURL,
         photoID: String, dateTaken: NSDate)    {
        
        self.title = title
        self.remoteURL = remoteURL
        self.photoID = photoID
        self.dateTaken = dateTaken
        
    }   // end init(...)
    
}   // end Photo
