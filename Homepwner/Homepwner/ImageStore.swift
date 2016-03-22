//
//  ImageStore.swift
//  Homepwner
//
//  Created by Robert Hieger on 3/21/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

/**********************************************************
 *                                                        *
 * ImageStore Class                                       *
 *                                                        *
 * The ImageStore() class stores images taken by the      *
 * user of Homepwner, allows those to be read into        *
 * memory for display on the UIImageView, and provides    *
 * a cache that gives quick access to these images, but   *
 * flushes the memory of the references to these images   *
 * when a low memory warning is received. This prevents   *
 * the application from crashing due to running out of    *
 * available memory.                                      *
 *                                                        *
 **********************************************************
*/

class ImageStore {
    
    // PROPERTIES:
    
    // Instantiate a cache object for photos.
    
    let cache = NSCache()
    
    // METHODS:
    
    // Setter method to set image:
    
    func setImage(image: UIImage, forKey key: String) {
    
        cache.setObject(image, forKey: key)
        
    }   // end setImage(image: UIImage, forKey key: String)
    
    // Getter method to retrieve image:
    
    func imageForKey(key: String) -> UIImage? {
        
        // Return a UIImage object, if present.
        
        return cache.objectForKey(key) as? UIImage
        
    }   // end imageForKey(key: String) -> UIImage?
    
    // Delete image from ImageStore:
    
    func deleteImageForKey(key: String) {
        
        cache.removeObjectForKey(key)
        
    }   // end deleteImageForKey(key: String)
    
}   // end ImageStore
