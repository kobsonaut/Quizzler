//
//  ViewController.swift
//  Quizzler
//
//  Created by Kobsonauta on 26.10.2017.
//  Copyright © 2017 Kobsonauta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }


    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1)/13"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
    }


    func nextQuestion() {
        if questionNumber < allQuestions.list.count {
            print(allQuestions.list.count)
            print(questionNumber)
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "Awesome", message: "You've just finished all the questions, do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }


    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            score += 1
            ProgressHUD.showSuccess("Correct!")
        }
        else {
            ProgressHUD.showError("Wrong!")
        }
    }


    func startOver() {
        score = 0
        questionNumber = 0
        nextQuestion()

    }



}

