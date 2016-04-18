//
//  PhotoStore.swift
//  Photorama
//
//  Created by Robert Hieger on 4/18/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

/************************************************************
 *                                                          *
 * PhotoStore Class:                                        *
 *                                                          *
 * This class is responsible for sending the request to     *
 * the Flickr server and interpreting the server's          *
 * response to the query.                                   *
 *                                                          *
 ************************************************************
*/

import Foundation

class PhotoStore    {
    
    // MARK: - Properties
    
    let session: NSURLSession = {
        
       let config =
        NSURLSessionConfiguration.defaultSessionConfiguration()
        
        return NSURLSession(configuration: config)
        
    }() // end session
    
    
    // MARK: - Methods
    
    func fetchRecentPhotos()    {
        
        let url = FlickerAPI.recentPhotosURL()
        
        let request = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request) {
            
            (data, response, error) -> Void in
            
            if let jsonData = data {
                
                do  {
                    
                    let jsonObject: AnyObject =
                    try NSJSONSerialization.JSONObjectWithData(jsonData,
                                        options: [] )
                    
                    print(jsonObject)
                    
                }   catch let error {
                    
                    print("Error creating JSON object: \(error)")
                    
                }   // end do-try-catch
                
            }   else if let requestError = error {
                
                print( "Error fetching recent photos: \(requestError)" )
                
            }   else    {
                
                print("Unexpected error with the request.")
                
            }   // end else if-else
            
        }   // end task
        
        task.resume()
        
    }   // end fetchRecentPhotos()
    
}   // end PhotoStore
