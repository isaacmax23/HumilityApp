//
//  QuizModel.swift
//  HumilityApp
//
//  Created by user217650 on 6/25/22.
//

import Foundation
struct Quiz{
    var questionNumber : Int
    var quizCompleted: Bool = false
    var quizModel: QuizModel
    var scoreOptions: [ScoreOption]
}
struct QuizModel{
    var question: String
    var category: Int
    var selectedScore: Int?
}

struct ScoreOption: Identifiable{
    var id: Int
    var score: String
  //  var scoreSelected: Bool = false
}
struct SelectedScore{
    var scores: [Int]=[]
}
