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
    
    // MARK: - Properties
    
    var currentLine: Line?          // Current line being drawn?
    
    var finishedLines = [Line]()    // Array of type Line
    
    
    // MARK: - Methods
    
    func strokeLine(line: Line)   {
        
        // Define the line's path.
        
        let path = UIBezierPath()   // Instantiate UIBezierPath object.
        
        // Set the styling for the line:
        
        path.lineWidth = 10
        path.lineCapStyle = CGLineCap.Round
        
        // Set the beginning and ending points of the line:
        
        path.moveToPoint(line.begin)
        path.moveToPoint(line.end)
        
        // Draw the line:
        
        path.stroke()
        
    }   // end strokeLine(line: Line)
    
    
    // MARK: - Built-In Method Overrides
    
    override func drawRect(rect: CGRect) {
        
        // Draw finished lines in black.
        
        UIColor.blackColor().setStroke()
        
        // Loop through and draw finished lines:
        
        for line in finishedLines   {
            
            strokeLine(line)
            
        }   // end for line in finishedLines
        
        // Check if line is currently being drawn. If so, draw
        // it in red.
        
        if let line = currentLine   {
            
            UIColor.redColor().setStroke()
            
            strokeLine(line)
            
        }   // end if
        
    }   // end override func drawRect(rect: CGRect)
    
}   // end class DrawView: UIView
