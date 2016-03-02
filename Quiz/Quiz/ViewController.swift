//
//  ViewController.swift
//  Quiz
//
//  Created by Robert Hieger on 2/28/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // OUTLETS:
    
    @IBOutlet var currentQuestionLabel: UILabel!    // Label for current
                                                    // question
    
    // Center X Constraint for currentQuestionLabel:
    
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextQuestionLabel: UILabel!       // Label for next
                                                    // question
    
    // Center X Constraint for nextQuestionLabel:
    
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var answerLabel: UILabel!     // Label for answers
    
    
    // MODEL LAYER:
    
    // Declare/initialize array constant to contain questions.
    
    let questions: [String] = ["From what is cognac made?",
                               "What is 7 + 7?",
                               "What is the capital of Vermont?"]
    
    
    // Declare/initialize array constant to contain answers.
    
    let answers: [String] = ["Grapes",
                             "14",
                             "Montpelier"]
    
    // Set variable to track the current questions index (to which
    // question are we pointed?) For purposes of the Model Layer,
    // we will set the index to the first array element (0).
    
    var currentQuestionIndex: Int = 0;
    
    
    // ACTIONS:
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        
        // This action method advances the questionLabel to
        // the next question specified in the Model Layer
        // of the Model-View-Control pattern.
        
        // When "Next Question" button is tapped:
        
        ++currentQuestionIndex      // Advance index to next question.
        
        // If current question is the end of questions array,
        // reset the index to the beginning of the array.
        
        if currentQuestionIndex == questions.count  {
            
            currentQuestionIndex = 0
            
        }   // end if
        
        // Set the contents of the question:
        
        let question: String = questions[currentQuestionIndex]
        
        // Set the contents of questionLabel to the text of
        // the current question:
        
        nextQuestionLabel.text = question
        
        // Make sure to reset the answerLabel to "???"
        
        answerLabel.text = "???"
        
        // Animate the questionLabel fade-in:
        
        animateLabelTransitions()
        
    }   // end showNextQuestion()
    
    
    @IBAction func showAnswer(sender: AnyObject)    {
        
        // This action method shows the answer associated with
        // the question at the current question index in the
        // Model Layer.
        
        // When user taps "Show Answer" button, set the contents
        // of the answer to match current index of questions.
        
        let answer: String = answers[currentQuestionIndex]
        
        // Set the text of answerLabel to the text of the
        // current question:
        
        answerLabel.text = answer
        
    }   // end showAnswer(sender: AnyObject)
    
    
    // BUILT-IN METHOD OVERRIDES:
    
    // Override viewDidLoad() method:
    
    override func viewDidLoad() {
        
        // Call superimplementation of viewDidLoad().
        
        super.viewDidLoad()
        
        // Load the text of the first question into questionLabel
        // when the program loads.
        
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        // Set nextQuestionLabel opacity to 0.0%.
        
        nextQuestionLabel.alpha = 0
        
    }   // end override func viewDidLoad()
    
    
    // Override viewWillAppear() method:
    
    override func viewWillAppear(animated: Bool) {
        
        // Call the super implementation of viewWillAppear().
        
        super.viewWillAppear(animated)
        
        // Set initial opacity of nextQuestionLabel to 0.0%.
        
        nextQuestionLabel.alpha = 0
        
        // For this slight modification, I am indebted to a posting
        // on the Big Nerd Ranch Forum for the book at the following
        // URL:
        //
        // http://forums.bignerdranch.com/viewtopic.php?f=627&t=10994
        
        
        
        // animateLabelTransitions()   // Fade label in.
        
        // NOTE: After using currentQuestionLabel and nextQuestionLabel
        //       outlets, calling animateLabelTransitions in
        //       viewWillAppear(animated: Bool) causes the first
        //       question to appear for a split second to be replaced
        //       immediately by "???". This issue seems to be fixed by
        //       commenting out animateLabelTransitions at this point.
        
    }   // end override func viewWillAppear(animated: Bool)
    
    
    // METHODS:
    
    func animateLabelTransitions()  {
        
        // Force any outstanding layout changes to occur:
        
        view.layoutIfNeeded()
        
        // Animate the opacity and center x constraints of
        // currentQuestionLabel and nextQuestionLabel:
        
        // Set the screen width.
        
        let screenWidth = view.frame.width
        
        // Set the center x constraint for nextQuestionLabel:
        
        self.nextQuestionLabelCenterXConstraint.constant = 0
        
        // Set the center x constraint for currentQuestionLabel:
        
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        // Animate the opacity of currentQuestionLabel
        // and nextQuestionLabel.
        
        UIView.animateWithDuration(0.5,
            delay: 0,
            options: [.CurveLinear],
            animations: {
                self.currentQuestionLabel.alpha = 0 // transparent
                self.nextQuestionLabel.alpha = 1    // 100% opaque
                self.view.layoutIfNeeded()          // update layout
            },
            
            completion: { _ in
                
                // Swap the currentQuestionLabel with
                // the nextQuestionLabel.
                
                swap(&self.currentQuestionLabel,
                     &self.nextQuestionLabel)
                
                // Swap the center x value
                // of currentQuestionLabelCenterXConstraint
                // for nextQuestionLabelCenterXConstraint.
                
                swap(&self.currentQuestionLabelCenterXConstraint,
                     &self.nextQuestionLabelCenterXConstraint)
                
                // Update the off screen label:
                
                self.updateOffScreenLabel()
                
        })  // end UIView.animateWithDuration
        
    }   // end animateLabelTransitions()
    
    func updateOffScreenLabel() {
        
        // Set the screen width:
        
        let screenWidth = view.frame.width
        
        // Set center x of nextQuestionLabel one screen width
        // to the left.
        
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
        
    }   // end func updateOffScreenLabel()
   
}   // end ViewController: UIViewController
