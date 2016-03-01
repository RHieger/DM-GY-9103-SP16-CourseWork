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
    
    @IBOutlet var questionLabel: UILabel!   // Label for questions
    
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
        
        questionLabel.text = question
        
        // Make sure to reset the answerLabel to "???"
        
        answerLabel.text = "???"
        
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
        
        questionLabel.text = questions[currentQuestionIndex]
        
    }   // end override func viewDidLoad()
    
    
    // Override viewWillAppear() method:
    
    override func viewWillAppear(animated: Bool) {
        
        // Call the super implementation of viewWillAppear().
        
        super.viewWillAppear(animated)
        
        // Set initial opacity of questionLabel to 0.0%.
        
        questionLabel.alpha = 0
        
        // For this slight modification, I am indebted to a posting
        // on the Big Nerd Ranch Forum for the book at the following
        // URL:
        //
        // http://forums.bignerdranch.com/viewtopic.php?f=627&t=10994
        
        animateLabelTransitions()   // Fade label in.
        
    }   // end override func viewWillAppear(animated: Bool)
    
    
    // METHODS:
    
    func animateLabelTransitions()  {
        
        // This method will be used to fade in the text
        // assigned to each instance of questionLabel.
        
        let animationClosure = {
            
            () -> Void in
            
            // Set the opacity of questionLabel to 100%.
            
            self.questionLabel.alpha = 1
            
        }   // end animationClosure
        
        // Animate fade-in of questionLabel opacity to 100%.
        
        UIView.animateWithDuration(0.5, animations: animationClosure)
        
    }   // end animateLabelTransitions()
   
}   // end ViewController: UIViewController
