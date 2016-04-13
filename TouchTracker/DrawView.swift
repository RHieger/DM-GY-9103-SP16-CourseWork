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
    
    
    // MARK: @IBInspectables
    
    @IBInspectable var finishedLineColor: UIColor = UIColor.blackColor() {
    
        didSet {
    
            setNeedsDisplay()
    
        }   // end didSet
    
    }   // end @IBInspectable var finishedLineColor
    
    @IBInspectable var currentLineColor: UIColor = UIColor.redColor() {
        
        didSet {
            
            setNeedsDisplay()
            
        }   // end didSet
        
    }   // end @IBInspectable var currentLineColor
    
    @IBInspectable var lineThickness: CGFloat = 10 {
        
        didSet  {
            
            setNeedsDisplay()
            
        }   // end didSet
        
    }   // end @IBInspectable var lineThickness

    
    // MARK: - Methods
    
    func strokeLine(line: Line) {
        
        // strokeLine creates the outline of each line.
        
        let path = UIBezierPath()
        
        // Set line styling.
        
        path.lineWidth = lineThickness
        path.lineCapStyle = CGLineCap.Round
        
        // Set path (beginning and ending points for line).
        
        path.moveToPoint(line.begin)
        path.addLineToPoint(line.end)
        
        // Create the path.
        
        path.stroke()
        
    }   // end strokeLine(line: Line)
    
    // Handler for doubleTap
    
    func doubleTap(gestureRecognizer: UITapGestureRecognizer)    {
        
        // Debugging output to console.
        
        print("Recognized a double tap.")
        
        // Remove all current and finished lines from view.
        
        currentLines.removeAll(keepCapacity: false)
        
        finishedLines.removeAll(keepCapacity: false)
        
        // Update view.
        
        setNeedsDisplay()
        
    }   // end doubleTap()
    
    func tap(gestureRecognizer: UITapGestureRecognizer) {
        
        // Debugging output to console.
        
        print("Recognized a tap.")
        
    }   // end tap(gestureRecognizer: UITapGestureRecognizer)       d
    
    
    // MARK: - Built-In Function Overrides
    
    override func drawRect(rect: CGRect) {
        
        // This method sets the color for the line stroke
        // and draws the line by calling strokeLine(line: Line).
        
        // Set line stroke color to finishedLineColor
        
        finishedLineColor.setStroke()
        
        for line in finishedLines {
            
            // Call strokeLine(line: Line).
            
            strokeLine(line)
            
        }   // end for line in finishedLines
        
        // Now handle lines currently being drawn.
        
        // If there is a line currently being drawn,
        // set its stroke to currentLineColor.
            
        currentLineColor.setStroke()
        
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
        
        // NOTE: print(__FUNCTION__), as specified in book is
        //       now deprecated in favor of the above syntax.
        
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
    
    
    // MARK: - Required init()
    
    required init?(coder aDecoder: NSCoder)   {
        
        // Call super implementation.
        
        super.init(coder: aDecoder)
        
        // Define a UITapGestureRecognizer for Double Tap.
        
        let doubleTapRecognizer =
            UITapGestureRecognizer( target: self,
            action: #selector( DrawView.doubleTap(_:) ) )
        
        // NOTE: The syntax for "action:" above replaces the
        //       now deprecated syntax, action: "doubleTap".
        
        doubleTapRecognizer.numberOfTapsRequired = 2
        
        // Prevent touchesBegan from being called immediately
        // so that if the gesture is a tap gesture, a point
        // will not be drawn.
        
        doubleTapRecognizer.delaysTouchesBegan = true
        
        // Add doubleTapGestureRecognizer to DrawView.
        
        addGestureRecognizer(doubleTapRecognizer)
        
        // Define a UITapGestureRecognizer for Single Tap.
        
        let tapRecognizer =
        UITapGestureRecognizer( target: self,
                                action: #selector( DrawView.tap(_:) ) )
        
        // Prevent doubleTapRecognizer from being called immediately
        // so that if the gesture is a single tap, this gesture will
        // not be intercepted.
        
        tapRecognizer.delaysTouchesBegan = true
        
        // Add tapRecognizer to DrawView.
        
        addGestureRecognizer(tapRecognizer)
        
    }   // end init?(codeer: aCoder)
    
}   // end DrawView: UIView
