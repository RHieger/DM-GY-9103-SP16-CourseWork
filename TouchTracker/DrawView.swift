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

class DrawView: UIView, UIGestureRecognizerDelegate  {
    
    // MARK: - Properties
    
    // Dictionary of Line instances:
    
    var currentLines = [NSValue: Line]()
    
    var finishedLines = [Line]()            // Array of Line objects
    
    var selectedLineIndex: Int?     {
        
        // Add property observer so that "Delete" menu item
        // does not remain on the view after a doubleTap event.
        
        didSet {
        
            if selectedLineIndex == nil {
            
                let menu = UIMenuController.sharedMenuController()
            
                menu.setMenuVisible(false, animated: true)
            
            }   // end if
            
        }
        
    }   // end selectLineIndex: Int?
    
    var moveRecognizer: UIPanGestureRecognizer!     // To recognize moves
                                                    // of lines.
    
    
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
        
        // Set selectedLineIndex to nil to avoid application trapping.
        
        selectedLineIndex = nil
        
        // Remove all current and finished lines from view.
        
        currentLines.removeAll(keepCapacity: false)
        
        finishedLines.removeAll(keepCapacity: false)
        
        // Update view.
        
        setNeedsDisplay()
        
    }   // end doubleTap()
    
    func tap(gestureRecognizer: UITapGestureRecognizer) {
        
        // Debugging output to console.
        
        print("Recognized a tap.")
        
        // Return the point tapped.
        
        let point = gestureRecognizer.locationInView(self)
        
        selectedLineIndex = indexOfLineAtPoint(point)
        
        // Instantiate a menu controller to allow user to delete
        // the selected line.
        
        let menu = UIMenuController.sharedMenuController()
        
        // Now, if there is a selected line, present the menu.
        
        if selectedLineIndex != nil {
            
            // Make DrawView the target of menu item action messages.
            
            becomeFirstResponder()
            
            // Create new "Delete" menu item.
            
            let deleteItem =
                UIMenuItem( title: "Delete",
                           action: #selector(DrawView.deleteLine) )
            
            // Add "Delete" to menuItems.
            
            menu.menuItems = [deleteItem]
            
            // Tell the menu from where it should emanate, and show it.
            
            menu.setTargetRect( CGRect(x: point.x, y: point.y,
                                   width: 2, height: 2),
                                  inView: self )
            
            menu.setMenuVisible(true, animated: true)
            
        }   else    {
            
            // Hide the menu if no line is selected.
            
            menu.setMenuVisible(false, animated: true)
            
        }   // end if-else
        
        // Update view.
        
        setNeedsDisplay()
        
    }   // end tap(gestureRecognizer: UITapGestureRecognizer)
    
    // Find the line that has been selected by user.
    
    func indexOfLineAtPoint(point: CGPoint) -> Int? {
        
        // Find a line close to the point.
        
        for (index, line) in finishedLines.enumerate()  {
            
            let begin = line.begin  // Beginning point of line
            let end = line.end      // Ending point of line
            
            // Check a few points on the line.
            
            for t in CGFloat(0).stride(to: 1.0, by: 0.05)   {
                
                let x = begin.x + ( (end.x - begin.x) * t )     // x-coordinate
                let y = begin.y + ( (end.y - begin.y) * t )     // y-coordinate
                
                // If the tapped point is within 20 points, let's
                // return this line.
                
                
                if hypot(x - point.x, y - point.y) < 20.0 {
                    
                    return index
                    
                }   // end if
                
            }   // end for
            
        }   // end for
        
        // If nothing is close enough to the selected point, then
        // we did not select a line.
        
        return nil
        
    }   // end indexOfLineAtPoint(point: CGPoint) -> Int?
    
    // deleteLine method deletes a line when user taps
    // "Delete" menu item appearing over selected line.
    
    func deleteLine(sender: AnyObject)   {
        
        // Remove selectedLine from list of finishedLines.
        
        if let index = selectedLineIndex    {
            
            finishedLines.removeAtIndex(index)
            
            // Set the selectedLineIndex to nil so location
            // of deleted line is destroyed.
            
            selectedLineIndex = nil
            
            // Update view.
            
            setNeedsDisplay()
            
        }   // end if
        
    }   // end deleteLine(sender: AnyObject)
    
    // longPress detects a long press of 0.5 seconds or longer
    // and allows the user to move the selected line from its
    // original location to a new one.
    
    func longPress(gestureRecognizer: UIGestureRecognizer)    {
        
        // Log debug data to console.
        
        print("Recognized a long press.")
        
        // Did the gesture begin?
        
        if gestureRecognizer.state == .Began    {
            
            // Set the beginning point of selected line.
            
            let point = gestureRecognizer.locationInView(self)
            
            // Get selectedLine.
            
            selectedLineIndex = indexOfLineAtPoint(point)
            
            if selectedLineIndex != nil     {
                
                currentLines.removeAll(keepCapacity: false)
                
            }   // end if
            
        }   else if gestureRecognizer.state == .Ended    {
            
            selectedLineIndex = nil
            
        }   // end if-if-else-if
        
        // Update DrawView
        
        setNeedsDisplay()
        
    }   // end longPress(gestureRecognizer: UIGesture Recognizer)
    
    // Move selectedLine.
    
    func moveLine(gestureRecognizer: UIPanGestureRecognizer)   {
        
        // Log debug output to console.
        
        print("Recognized a pan.")
        
        // If a line is selected...
        
        if let index = selectedLineIndex    {
            
            // When the pan recognizer changes its position...
            
            // FULL DISCLOSURE: I found this solution on the Big Nerd
            //                  Ranch forums. I had tried something
            //                  similar, but was only partly successful
            //                  in that the undeleted selected line
            //                  moved along with the new line being
            //                  drawn until it was intercepted by a
            //                  conditional regarding the selectedLineIndex.
            //
            //                  The code appearing below was found at the
            //                  following URL:
            //
            // http://forums.bignerdranch.com/viewtopic.php?f=637&t=11379
            
            if gestureRecognizer.state == .Changed
                && !UIMenuController.sharedMenuController().menuVisible {
                
                // How far has the pan moved?
                
                let translation =
                gestureRecognizer.translationInView(self)
                
                // Add the translation to the current beginning
                // and ending points of the line; make sure there
                // are no copy and paste typos!
                
                finishedLines[index].begin.x += translation.x
                finishedLines[index].begin.y += translation.y
                finishedLines[index].end.x += translation.x
                finishedLines[index].end.y += translation.y
                
                // Set translation point to 0 after each event so
                // that new value will be registered on each event.
                
                gestureRecognizer.setTranslation(CGPoint.zero,
                                                 inView: self)
                
                // Update DrawView.
                
                setNeedsDisplay()
                
            }   // end if
            
        }   else    {
            
            // If no line is selected, do not do anything.
            
            return
            
        }   // end if-if-else
        
    }   // end moveLine(gestureRecognizer: UIPanGestureRecognizer)
    
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWithGestureRecognizer
        otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
    
    }   // end gestureRecognizer(_:shouldRecognizeSimultaneously...)
    
    
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
        
        // If line is selected set its color to green.
        
        if let index = selectedLineIndex    {
            
            // Set the color to be rendered.
            
            UIColor.greenColor().setStroke()
            
            // Add selectedline to index of finishedLines.
            
            let selectedLine = finishedLines[index]
            
            // Render selectedLine as green.
            
            strokeLine(selectedLine)
            
        }   // end if
        
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
    
    // Override canBecomeFirstResponder to allow appearance of
    // "Delete" menu.
    
    override func canBecomeFirstResponder() -> Bool {
        
        return true
        
    }   // end canBecomeFirstResponder() -> Bool
    
    
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
        
        // NOTE: The syntax for "action:" above replaces the
        //       now deprecated syntax, action: "tap".

        
        // Prevent tapRecognizer from being called immediately
        // so that if the gesture is a double tap, this gesture will
        // not be intercepted.
        
        tapRecognizer.delaysTouchesBegan = true
        
        // Prevent doubleTapRecognizer from intercepting what might
        // have been a single tap.
        
        tapRecognizer.requireGestureRecognizerToFail(doubleTapRecognizer)
        
        // Add tapRecognizer to DrawView.
        
        addGestureRecognizer(tapRecognizer)
        
        // Instantiate a UILongPressGestureRecognizer object.
        
        let longPressRecognizer =
            UILongPressGestureRecognizer(target: self,
            action: #selector( DrawView.longPress(_:) ) )
        
        // NOTE: The syntax for "action:" above replaces the
        //       now deprecated syntax, action: "longPress".
        
        // Add longPressRecognizer to DrawView.
        
        addGestureRecognizer(longPressRecognizer)
        
        moveRecognizer =
            UIPanGestureRecognizer( target: self,
            action: #selector( DrawView.moveLine(_:) ) )
        
        // Set the delegate for moveRecognizer so that more
        // than one gesture may be recognized at the same
        // time on the same object.
        
        moveRecognizer.delegate = self
        
        moveRecognizer.cancelsTouchesInView = false
        
        addGestureRecognizer(moveRecognizer)
        
    }   // end init?(codeer: aCoder)
    
}   // end DrawView: UIView
