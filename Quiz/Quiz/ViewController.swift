//
//  ViewController.swift
//  Quiz
//
//  Created by Robert Hieger on 1/26/16.
//  Copyright © 2016 Hieger Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Declare necessary outlets for top and bottom
    // labels in Main.storyboard.
    
    @IBOutlet var questionLabel: UILabel!
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
        
        questionLabel.text = question
        
        answerLabel.text = "???"
        
    }   // end showNextQuestion(sender: AnyObject)
    
    @IBAction func showAnswer(sender: AnyObject)    {
        
        // Specify content for answer and answerLabel:
        
        let answer: String = answers[currentQuestionIndex]
        
        answerLabel.text = answer
        
    }   // end showAnswer(sender: AnyObject)

}   // end viewController

