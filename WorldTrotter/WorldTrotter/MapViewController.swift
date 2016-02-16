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
        
        // VIEW CONSTRAINTS:
        
        // Add a Segmented Control View to the MKMapView.
        
        let segmentedControl =
        UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        
        // Set background color for segmentedControl.
        
        segmentedControl.backgroundColor =
        UIColor.whiteColor().colorWithAlphaComponent(0.5)
        
        // Set the selected segment in the segmentedControl.
        
        segmentedControl.selectedSegmentIndex = 0   // Leftmost segment
        
        // Disable auto-resizing to constraint translation
        // to avoid view constraint issues.
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        // Add this subview to mapView.
        
        view.addSubview(segmentedControl)
        
        // Set anchor constraints of segmentedControl so that they are
        // aligned with the superview, in this case mapView.
        
        let topConstraint =
        segmentedControl.topAnchor.constraintEqualToAnchor (view.topAnchor)
        
        let leadingConstraint =
        segmentedControl.leadingAnchor.constraintEqualToAnchor (view.leadingAnchor)
        
        let trailingConstraint =
        segmentedControl.trailingAnchor.constraintEqualToAnchor (view.trailingAnchor)
        
        // Activate segmentedControl view constraints.
        
        topConstraint.active = true
        
        leadingConstraint.active = true
        
        trailingConstraint.active = true
        
    }   // end override func loadView()
    
    // Override func viewDidLoad().
    
    override func viewDidLoad() {
        
        // Always load super implementation of viewDidLoad().
        
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
        
    }   // end override func viewDidLoad()
    
    // Override
    
}   // end MapViewController