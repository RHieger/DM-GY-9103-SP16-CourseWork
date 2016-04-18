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

enum PhotoResult {
    
    // This enumeration encapsulates the result status
    // of the NSURLRequest.
    
    case Success( [Photo] )
    case Failure(ErrorType)
    
}   // end PhotoResult

enum FlickrError: ErrorType {
    
    case InvalidJSONData
    
}   // end FlickrError

struct FlickerAPI {
    
    // MARK: - Fields
    
    // Reference the base URL for web service requests.
    
    private static let baseURLString =
    "https://api.flickr.com/services/rest"
    
    private static let APIKey = "2ad71fb2b8b7e5543cb2db8e5821570b"
    
    private static let dateFormatter: NSDateFormatter = {
        
        let formatter = NSDateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return formatter
        
    }()   // end dateFormatter
    
    
    // MARK: - Methods
    
    private static func flickrURL( method method: Method,
                                  parameters: [String: String]? ) -> NSURL  {
        
        // Build components for NSURL object.
        
        let components = NSURLComponents(string: baseURLString)
        
        var queryItems = [NSURLQueryItem]()
        
        let baseParams = [
                    "method": method.rawValue,
                    "format": "json",
            "nojsoncallback": "1",
            "api_key": APIKey
        ]
        
        for (key, value) in baseParams {
            
            let item = NSURLQueryItem(name: key, value: value)
            
            queryItems.append(item)
            
        }
        
        if let additionalParameters = parameters {
            
            for (key, value) in additionalParameters    {
                
                let item = NSURLQueryItem(name: key, value: value)
                
                queryItems.append(item)
                
            }   // end for
            
        }   // end additionalParameters
        
        // Return completed NSURL object.
        
        components?.queryItems = queryItems
        
        return components!.URL!
        
    }   // end flickrURL(method method: Method...) -> NSURL

    static func recentPhotosURL() -> NSURL  {
        
        return flickrURL(method: .RecentPhotos,
                         parameters: ["extras": "url_h, date_taken"] )
        
    }   // end recentPhotosURL() -> NSURL
    
    static func photosFromJSONData(data: NSData) -> PhotoResult {
        
        do  {
            
            let jsonObject: AnyObject = try
            NSJSONSerialization.JSONObjectWithData( data,
                            options: [] )
            
            guard let
                jsonDictionary = jsonObject as? [NSObject: AnyObject],
            photos = jsonDictionary["photos"] as? [String: AnyObject],
            photosArray = photos["photo"] as? [ [String: AnyObject] ]
            
            else {
                    
                // The jsonObject does not meet our expectations.
                
                return .Failure(FlickrError.InvalidJSONData)
                    
            }   // end guard let-else
            
            var finalPhotos = [Photo]()
            
            return .Success(finalPhotos)
            
        }   catch let error {
            
            return .Failure(error)
            
        }
        
    }   // end photosFromJSONData(data: NSData) -> PhotoResult
    
}   // end flickerAPI
