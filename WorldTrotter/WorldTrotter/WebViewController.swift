//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Robert Hieger on 2/20/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

import WebKit             // Library needed to support WebView.

// Now build the class:

class WebViewController: UIViewController   {
    
    // PROPERTIES:
    
    var webView: WKWebView!     // Provide reference to view.
    
    // METHODS:
    
    // Override loadView().
    
    override func loadView() {
        
        // Call super implementation of loadView().
        
        super.loadView()
        
        // Instantiate a WKWebView object.
        
        webView = WKWebView()
        
        // Set webView as root view of WebViewController.
        
        view = webView
        
    }   // end loadView()
    
    // Override viewDidLoad() in order to specify URL.
    
    override func viewDidLoad() {
        
        // Call super implementation of viewDidLoad()
        
        super.viewDidLoad()
        
        // Declare NSURL object to hold URL.
        
        let url = NSURL(string: "https://www.bignerdranch.com")
        
        // Declare NSURLRequest object to hold URL request.
        
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
        
    }   // end viewDidLoad()
    
    
}   // end WebViewController