//
//  ViewController.swift
//  Quiz
//
//  Created by Robert Hieger on 1/26/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        // Call superclass of viewDidLoad()
        
        super.viewDidLoad()
        
        // Declare variable to store question:
        
        let question = questions[currentQuestionIndex]
        
        // Set questionLabel to first question in array:
        
        currentQuestionLabel.text = question
        
        updateOffScreenLabel()
        
    }   // end viewDidLoad()
    
    func updateOffScreenLabel() {
        
        // Set the screen width.
        
        let screenWidth = view.frame.width
        
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
        
    }   // end updateOffScreenLael()
    
    // Override viewWillAppear().
    
    override func viewWillAppear(animated: Bool) {
        
        // Call super implementation of viewWillAppear(animated: Bool)
        
        super.viewWillAppear(animated)
        
        // Set questionLabel's initial alpha value.
        
        nextQuestionLabel.alpha = 0
        
    }   // end override func viewWillAppear(animated: Bool)

    // Declare necessary outlets for top and bottom
    // labels in Main.storyboard.
    
    @IBOutlet var currentQuestionLabel: UILabel!
    
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextQuestionLabel: UILabel!
    
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] =
    ["From what is cognac made?",
        "What is 7 + 7?",
        "What is the capital of Vermont?"]
    
    let answers: [String] =
    ["Grapes",
        "14",
        "Montpelier"]
    
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion(sender: AnyObject)  {
        
        ++currentQuestionIndex      // Using prefix notation, increment
                                    // current question index.
        
        // If currentQuestionIndex is the same as the count of
        // elements in questions array, set the current index to
        // 0 to start from beginning:
        
        if currentQuestionIndex == questions.count   {
            
            currentQuestionIndex = 0;
            
        }   // end if
        
        // Specify content for question, questionLabel and
        // answerLabel views.
        
        let question: String = questions[currentQuestionIndex]
        
        nextQuestionLabel.text = question
        
        answerLabel.text = "???"
        
        animateLabelTransitions()
        
    }   // end showNextQuestion(sender: AnyObject)
    
    @IBAction func showAnswer(sender: AnyObject)    {
        
        // Specify content for answer and answerLabel:
        
        let answer: String = answers[currentQuestionIndex]
        
        answerLabel.text = answer
        
    }   // end showAnswer(sender: AnyObject)
    
    // METHODS:
    
    func animateLabelTransitions()  {
        
        // Animate the alpha and center X constraints.
        
        let screenWidth = view.frame.width
        
        self.nextQuestionLabelCenterXConstraint.constant = 0
        
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animateWithDuration(0.5,
            delay: 0,
            options: [],
            animations: {
                
                self.currentQuestionLabel.alpha = 0
                self.nextQuestionLabel.alpha = 1
                
                self.view.layoutIfNeeded()
                
            },
            completion: { _ in
                
              swap(&self.currentQuestionLabel,
                   &self.nextQuestionLabel)
                
              swap(&self.currentQuestionLabelCenterXConstraint,
                   &self.nextQuestionLabelCenterXConstraint)
                
              self.updateOffScreenLabel()
                
            } )
    
    }   // end animateLabelTransitions()

}   // end viewController
