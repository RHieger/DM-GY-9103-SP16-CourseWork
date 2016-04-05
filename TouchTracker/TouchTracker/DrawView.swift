//
//  DrawView.swift
//  TouchTracker
//
//  Created by Robert Hieger on 4/5/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

// DrawView Class:
//
// The DrawView class defines a line that might be in the process
// of being drawn. This takes the form of an optional of type Line.
// An additional property is defined as an empty array of type Line
// that holds any lines that have already been drawn.

class DrawView: UIView  {
    
    var currentLine: Line?          // Current line being drawn?
    
    var finishedLines = [Line]()    // Array of type Line
    
}   // end class DrawView: UIView
