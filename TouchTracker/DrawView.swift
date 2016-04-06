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
// The DrawView class is a UIView object that the defines
// the view(s) controlled by ViewController.swift.

class DrawView: UIView  {
    
    // MARK: - Properties
    
    var currentLine: Line?          // Optional to hold current line
    
    var finishedLines = [Line]()    // Array of Line objects
    
    
    // MARK: - Methods
    
    func strokeLine(line: Line) {
        
        // strokeLine creates the outline of each line.
        
        let path = UIBezierPath()
        
        // Set line styling.
        
        path.lineWidth = 10
        path.lineCapStyle = CGLineCap.Round
        
        // Set path (beginning and ending points for line).
        
        path.moveToPoint(line.begin)
        path.addLineToPoint(line.end)
        
        // Create the path.
        
        path.stroke()
        
    }   // end strokeLine(line: Line)
    
    
    // MARK: - Built-In Function Overrides
    
    override func drawRect(rect: CGRect) {
        
        // This method sets the color for the line stroke
        // and draws the line by calling strokeLine(line: Line).
        
        // Draw finished lines in black.
        
        UIColor.blackColor().setStroke()
        
        for line in finishedLines {
            
            // Call strokeLine(line: Line).
            
            strokeLine(line)
            
        }   // end for line in finishedLines
        
        // Now handle lines currently being drawn.
        
        if let line = currentLine   {
            
            // If there is a line currently being drawn,
            // draw it in red.
            
            UIColor.redColor().setStroke()
            
            // Call strokeLine(line: Line).
            
            strokeLine(line)
            
        }   // end if let line = currentLine
        
    }   // end override func drawRect(rect: CGRect)
    
    // Now we have to transform touches into lines rendered
    // on the screen. To do this, we override three methods:
    // touchesBegan(_:withEvent), touchesMoved(_:withEvent)
    // and touchesEnded(_:withEvent).
    
    override func touchesBegan(touches: Set<UITouch>,
                       withEvent event: UIEvent?)       {
        
        let touch = touches.first!
        
        // Get location of the touch in the view's
        // coordinate system.
        
        let location = touch.locationInView(self)
        
        // Pass the value of location to currentLine.
        
        currentLine = Line(begin: location, end: location)
        
        // Update the view.
        
        setNeedsDisplay()
        
    }   // end touchesBegan(_:withEvent)
    
    
    override func touchesMoved(touches: Set<UITouch>,
                       withEvent event: UIEvent?)       {
        
        let touch = touches.first!
        
        // Get location of the touch in the view's
        // coordinate system.
        
        let location = touch.locationInView(self)
        
        // Define a new end point for currentLine.
        
        currentLine?.end = location
        
        // Update the view.
        
        setNeedsDisplay()
        
    }   // end touchesBegan(_:withEvent)
    
    override func touchesEnded(touches: Set<UITouch>,
                               withEvent event: UIEvent?)  {
        
        if var line = currentLine   {
            
            let touch = touches.first!
            
            let location = touch.locationInView(self)
            
            line.end = location
            
            // Append currentLine to finishedLines.
            
            finishedLines.append(line)
            
        }   // end if var line = currentLine
        
        currentLine = nil
        
        setNeedsDisplay()
        
    }   // end touchesBegan(_:withEvent)
    
}   // end DrawView: UIView
