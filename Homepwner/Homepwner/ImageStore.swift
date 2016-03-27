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
    
    // MARK: - Properties
    
    // Instantiate a cache object for photos.
    
    let cache = NSCache()
    
    // MARK: - Methods
    
    // Setter method to set image:
    
    func setImage(image: UIImage, forKey key: String) {
    
        cache.setObject(image, forKey: key)
        
        // Create full URL for image.
        
        let imageURL = imageForURLKey(key)
        
        // Turn image into JPG data.
        
//        if let data =
//            UIImageJPEGRepresentation(image, 0.5)   {
//            
//            // Write JPEG image to full URL.
//            
//            data.writeToURL(imageURL, atomically: true)
//            
//        }   // if let data...
        
        // Bronze Challenge Revision of above if statement.
        // Save the image as PNG rather than JPG.
        
        if let data =
            UIImagePNGRepresentation(image)    {
            
            data.writeToURL(imageURL, atomically: true)
            
        }   // end if
        
    }   // end setImage(image: UIImage, forKey key: String)
    
    // Getter method to retrieve image:
    
    func imageForKey(key: String) -> UIImage? {
        
        // If image exists, load into view.
        
        if let existingImage =
            cache.objectForKey(key) as? UIImage {
            
            return existingImage
            
        }   // end if
        
        // Get the URL for the image.
        
        let imageURL = imageForURLKey(key)
        
        guard let imageFromDisk =
            UIImage(contentsOfFile: imageURL.path!) else  {
                
                return nil
                
        }   // end guard let imageFromDisk...
        
        // Set the object from cache.
        
        cache.setObject(imageFromDisk, forKey: key)
        
        return imageFromDisk
        
    }   // end imageForKey(key: String) -> UIImage?
    
    // Save photos to file system.
    
    // NOTE: This implementation uses the NSData class.
    
    func imageForURLKey(key: String) -> NSURL   {
        
        // Create NSURL for image file.
        
        let documentDirectories =
        NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory,
                                            inDomains: .UserDomainMask)
        
        let documentDirectory = documentDirectories.first!
        
        return documentDirectory.URLByAppendingPathComponent(key)
        
    }   // end imageForURLKey(key: String) -> NSURL
    
    // Delete image from ImageStore:
    
    func deleteImageForKey(key: String) {
        
        cache.removeObjectForKey(key)
        
        // Get imageURL.
        
        let imageURL = imageForURLKey(key)
        
        // Now delete image from file system.
        
        // NOTE: This do-catch contains an explicitly named error
        
        do  {
            
            try NSFileManager.defaultManager().removeItemAtURL(imageURL)
            
        }   catch let deleteError   {
            
            print("Error removing the image from disk: \(deleteError)")
            
        }   // end do-catch
        
    }   // end deleteImageForKey(key: String)
    
}   // end ImageStore
