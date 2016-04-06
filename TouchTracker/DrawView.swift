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
    
    // Dictionary of Line instances:
    
    var currentLines = [NSValue: Line]()
    
    var finishedLines = [Line]()            // Array of Line objects
    
    
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
        
        
        // If there is a line currently being drawn,
        // draw it in red.
            
        UIColor.redColor().setStroke()
        
        for (_, line) in currentLines   {
            
            strokeLine(line)
            
        }   // end for (_, line) in currentLines
        
    }   // end override func drawRect(rect: CGRect)
    
    // Now we have to transform touches into lines rendered
    // on the screen. To do this, we override three methods:
    // touchesBegan(_:withEvent), touchesMoved(_:withEvent)
    // and touchesEnded(_:withEvent).
    
    override func touchesBegan(touches: Set<UITouch>,
                       withEvent event: UIEvent?)       {
        
        // Log statement to see the order of events:
        
        print(#function)
        
        for touch in touches    {
            
            let location = touch.locationInView(self)
            
            let newLine = Line(begin: location, end: location)
            
            let key = NSValue(nonretainedObject: touch)
            
            currentLines[key] = newLine
            
        }   // end for touch in touches
        
        // Redraw objects defined by CGRect:
        
        setNeedsDisplay()
        
    }   // end touchesBegan(_:withEvent)
    
    
    override func touchesMoved(touches: Set<UITouch>,
                       withEvent event: UIEvent?)       {
        
        // Log statement to see the order of events:
        
        print(#function)
        
        for touch in touches    {
            
            let key = NSValue(nonretainedObject: touch)
            
            currentLines[key]?.end = touch.locationInView(self)
            
        }   // end for touch in touches
        
        setNeedsDisplay()
        
    }   // end touchesBegan(_:withEvent)
    
    override func touchesEnded(touches: Set<UITouch>,
                               withEvent event: UIEvent?)  {
        
        // Log statement to see the order of events:
        
        print(#function)
        
        for touch in touches    {
            
            let key = NSValue(nonretainedObject: touch)
            
            if var line = currentLines[key] {
                
                line.end = touch.locationInView(self)
                
                finishedLines.append(line)
                
                currentLines.removeValueForKey(key)
                
            }   // end if var line = currentLines[key]
            
        }   // end for touch in touches
        
        setNeedsDisplay()
        
    }   // end touchesBegan(_:withEvent)
    
}   // end DrawView: UIView
