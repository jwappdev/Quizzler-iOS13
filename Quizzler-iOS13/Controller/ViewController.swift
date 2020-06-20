//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1ButtonLabel: UIButton!
    @IBOutlet weak var answer2ButtonLabel: UIButton!
    @IBOutlet weak var answer3ButtonLabel: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        guard let userAnswer = sender.currentTitle else { return }
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        updateUI() // to set new score
        
        userGotItRight == true ? (sender.backgroundColor = .green) : (sender.backgroundColor = .red)
        quizBrain.switchNextQuestion()

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        answer1ButtonLabel.setTitle(quizBrain.getAnswer(button: 0), for: .normal)
        answer2ButtonLabel.setTitle(quizBrain.getAnswer(button: 1), for: .normal)
        answer3ButtonLabel.setTitle(quizBrain.getAnswer(button: 2), for: .normal)
        
        answer1ButtonLabel.backgroundColor = UIColor.clear
        answer2ButtonLabel.backgroundColor = UIColor.clear
        answer3ButtonLabel.backgroundColor = UIColor.clear
    }
}

