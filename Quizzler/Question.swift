//
//  Question.swift
//  Quizzler
//
//  Created by Kobsonauta on 26.10.2017.
//  Copyright © 2017 Kobsonauta. All rights reserved.
//

import Foundation

class Question {
    let questionText: String
    let answer: Bool

    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
