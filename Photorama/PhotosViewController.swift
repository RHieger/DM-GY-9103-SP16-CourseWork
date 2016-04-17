//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Robert Hieger on 4/16/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

/*************************************************************
 *                                                           *
 * PhotosViewController Class:                               *
 *                                                           *
 * This class controls all views appearing within the root   *
 * view controller, in this case, reserved for a UIImageView *
 * whose contents are an image pulled from a Web Service.    *
 *                                                           *
 *************************************************************
*/

import UIKit

class PhotosViewController: UIViewController    {
    
    // MARK: - IBOutlets
    
    @IBOutlet var imageView: UIImageView!
    
}   // end class PhotosViewController: UIViewController