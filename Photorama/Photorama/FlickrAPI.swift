//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Robert Hieger on 4/17/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

/**************************************************************
 *                                                            *
 * FlickrAPI Struct:                                          *
 *                                                            *
 * The FlickrAPI type, implemented as a struct, defines the   *
 * structure of a request for the Flickr API, and, together   *
 * with the PhotoStore class, sends URL requests to Flicker   *
 * to retrieve photos.                                        *
 *                                                            *
 **************************************************************
*/

import Foundation

enum Method: String {
    
    // This enumeration contains raw strings that
    // correspond to methods in the Flicker API.
    
    case RecentPhotos = "flickr.photos.getRecent"
    
}   // end Method

struct FlickerAPI {
    
    // MARK: - Fields
    
    // Reference the base URL for web service requests.
    
    private static let baseURL =
    "https://api.flickr.com/services/rest"
    
}   // end flickerAPI
