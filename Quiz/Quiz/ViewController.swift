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
        
        
        
    }   // end showNextQuestion(sender: AnyObject)
    
    @IBAction func showAnswer(sender: AnyObject)    {
        
        
        
    }   // end showAnswer(sender: AnyObject)

}   // end viewController

