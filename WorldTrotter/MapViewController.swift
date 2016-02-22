//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Robert Hieger on 2/18/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

import MapKit       // Required for UIMapView

class MapViewController: UIViewController   {
    
    // PROPERTIES:
    
    var mapView: MKMapView!     // Reference for MKMapView Object
    
    // METHODS:
    
    // Override loadView() to customize MapView.
    
    override func loadView() {
        
        // Instantiate a Map View Object.
        
        mapView = MKMapView()
        
        // Set mapView as root view of MapViewController.
        
        view = mapView
        
        // PROGRAMATIC CONSTRAINTS:
        
        // Add a UISegmentedControl as a subview of MapViewController.
        
        // 1. Instantiate UISegmentedControl object.
        
        let segmentedControl =
        UISegmentedControl( items: ["Standard", "Hybrid", "Satellite"] )

        // 2. Set background color for segmentedControl to 50% white.
        
        segmentedControl.backgroundColor =
        UIColor.whiteColor().colorWithAlphaComponent(0.5)
        
        // 3. Set the index of the selected segment (leftmost).
        
        segmentedControl.selectedSegmentIndex = 0
        
        // 4. Set segmentedControl as the target a .ValueChanged event.
        
        segmentedControl.addTarget(self,
            action: "mapTypeChanged:",
            forControlEvents: .ValueChanged)
        
        // 5. Disable auto-resizing masks.
        
//        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        // 6. Add segmentedControl as sub-view of MapViewController.
        
        view.addSubview(segmentedControl)
        
        // Add positioning constraints for segmentedControl.
        
        // 1. Constrain the bottom anchor to be 8 points below the
        //    the position of its superview, in this case mapView.
        
        let topConstraint =
        segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        
        // 2. Set layout margins to the Views LayoutMarginsGuide.
        
        let margins = view.layoutMarginsGuide
        
        // 3. Constrain leading anchor to LayoutMarginsGuide.
        
        let leadingConstraint =
            segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        
        // 4. Constrain trailing anchor to trailing anchor of superview.
        
        let trailingConstraint =
        segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        
        // 5. Activate the above constraints.
        
        topConstraint.active = true
        
        leadingConstraint.active = true
        
        trailingConstraint.active = true
        
    }   // end loadView()
    
    override func viewDidLoad() {
        
        // Call super implementation of viewDidLoad()
        
        super.viewDidLoad()
        
        // Log load of MapView to console.
        
        print("MapViewController loaded its view.")
        
    }   // end override func viewDidLoad()
    
    // mapTypeChanged: This event method will switch the view
    //                 to the specified type of map view when
    //                 the user touches a control on the
    //                 segmented control.
    
    func mapTypeChanged(segControl: UISegmentedControl) {
        
        // Declare switch to handle the event of a user
        // touching one of the segmented controls.
        
        switch segControl.selectedSegmentIndex  {
            
        case 0:
            mapView.mapType = .Standard
            
        case 1:
            mapView.mapType = .Hybrid
            
        case 2:
            mapView.mapType = .Satellite
            
        default:
            break
            
        }   // end segControl.selectedSegmentIndex
        
    }   // end mapTypeChanged(segControl: UISegmentedControl)
    
}   // end MapViewController