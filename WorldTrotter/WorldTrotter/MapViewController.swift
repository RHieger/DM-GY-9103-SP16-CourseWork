//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Robert Hieger on 2/15/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

import MapKit       // Required to create an MKMapView

class MapViewController: UIViewController {
    
    // PROPERTIES:
    
    var mapView: MKMapView!     // Forcibly unwrapped as this
                                // reference is required to
                                // create mapView
    
    // METHODS:
    
    // Override func loadView().
    
    override func loadView() {
        
        // Instantiate a map view object.
        
        mapView = MKMapView()
        
        // Set it as *the* view of this UIViewController object.
        
        view = mapView
        
    }
    
    // Override func viewDidLoad().
    
    override func viewDidLoad() {
        
        // Always load super implementation of viewDidLoad().
        
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
        
    }   // end override func viewDidLoad()
    
    // Override
    
}   // end MapViewController