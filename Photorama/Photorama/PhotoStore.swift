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
    
    func
    fetchRecentPhotos( completion completion: (PhotosResult) -> Void )    {
        
        let url = FlickrAPI.recentPhotosURL()
        
        let request = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request) {
            
            (data, response, error) -> Void in
            
            let result =
                self.processRecentPhotosRequest(data: data,
                                               error: error)
            
            completion(result)
            
        }   // end task
        
        task.resume()
        
    }   // end fetchRecentPhotos()
    
    func processRecentPhotosRequest(data data: NSData?,
                                        error: NSError?) -> PhotosResult   {
        
        guard let jsonData = data else {
            
            return .Failure(error!)
            
        }   // end guard let-else
        
        return FlickrAPI.photosFromJSONData(jsonData)
        
    }   // end func processRecentPhotosRequest(data data: NSData?,
        //                       error: NSErrror?) -> PhotoResults
    
}   // end PhotoStore
