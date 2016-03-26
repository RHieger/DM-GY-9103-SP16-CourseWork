//
//  AppDelegate.swift
//  Homepwner
//
//  Created by Robert Hieger on 3/2/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    
    var window: UIWindow?
    
    let itemStore = ItemStore()   // Provides reference for
                                  // saveChanges() method

    // MARK: - Methods

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Log method name to console.
        
        print(#function)
        
        // Override point for customization after application launch.
        
        // Instantiate ImageStore object at application launch:
        
        let imageStore = ImageStore()
        
        // Reference navController (root view controller) and set
        // itemsController as its top view:
        
        let navController =
        window!.rootViewController as! UINavigationController
        
        let itemsController =
        navController.topViewController as! ItemsViewController
        
        // Set the data store for itemsController:
        
        itemsController.itemStore = itemStore
        
        // Set imageStore as the ImageStore on application launch:
        
        itemsController.imageStore = imageStore
        
        return true
        
    }   // end application(_:didFinishLaunchingWithOptions:)
    

    func applicationWillResignActive(application: UIApplication) {
        
        // Log method name to console.
        
        print(#function)
    
    }   // end applicationWillResignActive(application: UIApplication)
    

    func applicationDidEnterBackground(application: UIApplication) {
        
        // Log method name to console.
        
        print(#function)
        
        // When user touches Home buttton on phone, call
        // ItemStore.saveChanges().
        
        let success = itemStore.saveChanges()
        
        if (success)    {
            
            // Print debug information to console.
            
            print("Saved all of the Items.")
            
        }   else    {
            
            // Print debug information to console.
            
            print("Could not save any of the Items.")
            
        }   // end if-else
        
    }   // end applicationDidEnterBackground(application: UIApplication)
    

    func applicationWillEnterForeground(application: UIApplication) {

        // Log method name to console.
        
        print(#function)

    }   // end applicationWillEnterForeground(application: UIApplication)
    

    func applicationDidBecomeActive(application: UIApplication) {
        
        // Log method name to console.
        
        print(#function)
        
    }   // end applicationDidBecomeActive(application: UIApplication)
    

    func applicationWillTerminate(application: UIApplication) {
        
        // Log method name to console.
        
        print(#function)
        
    }   // end applicationWillTerminate(application: UIApplication)

}   // end AppDelegate: UIResponder, UIApplicationDelegate
