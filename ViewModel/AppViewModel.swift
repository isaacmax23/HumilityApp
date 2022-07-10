//
//  AppViewModel.swift
//  HumilityApp
//
//  Created by user217650 on 6/25/22.
//

import Foundation

class AppViewModel: ObservableObject{
    
   static var currentIndex = 0
    @Published  var totalQuestions = quizQuestions.count
    @Published var completed=false
    @Published  var indScores:[Int]=[]
    @Published  var openScores:[Int]=[]
    @Published  var respectScores:[Int]=[]
    @Published  var locScores:[Int]=[]


    @Published var indTotal = 0
    @Published var openTotal = 0
    @Published var respectTotal = 0
    @Published var locTotal = 0
    
    
    static func createNewQuiz(currentQIndex: Int) -> Quiz{
        return Quiz(questionNumber: currentQIndex, quizModel: AppViewModel.quizQuestions[currentQIndex],scoreOptions: AppViewModel.scoreOptions)
    }
    @Published var model = AppViewModel.createNewQuiz(currentQIndex: AppViewModel.currentIndex)

    func endQuiz(){
        completed=false
        AppViewModel.currentIndex = 0
        model=AppViewModel.createNewQuiz(currentQIndex: AppViewModel.currentIndex)
    }
    func clearScores(){
        indScores.removeAll()
        openScores.removeAll()
        respectScores.removeAll()
        locScores.removeAll()
    }
    
    func categorizeScore(score:Int, category: Int){
        if category == 1{
            indScores.append(score)
        }
        else if category == 2{
            openScores.append(score)
        }
        else if category == 3{
            respectScores.append(score)
        }
        else{
            locScores.append(score)
        }
    }
    
    
    func nextQuestion(){
        if totalQuestions > AppViewModel.currentIndex+1  {
        AppViewModel.currentIndex=AppViewModel.currentIndex+1
        self.model=AppViewModel.createNewQuiz(currentQIndex: AppViewModel.currentIndex)
        }
        else{
            indTotal = indScores.reduce(0,+)
            openTotal = openScores.reduce(0,+)
            respectTotal = respectScores.reduce(0, +)
            locTotal = locScores.reduce(0, +)
            clearScores()
            completed=true
            
        }
    }
}

extension AppViewModel{
    static var quizQuestions: [QuizModel] {
        [QuizModel(question: "1. My ideas are usually better than other people’s ideas", category: 4),
         QuizModel(question: "2. For the most part, others have more to learn from me than I have to learn from them.", category: 4),
         QuizModel(question: "3. When I am really confident in a belief, there is very little chance that belief is wrong.", category: 4),
         QuizModel(question: "4. I’d rather rely on my own knowledge about most topics than turn to others for  expertise.", category: 4),
        QuizModel(question: "5. On important topics, I am not likely to be swayed by the viewpoints of others.", category: 4),
        QuizModel(question: "6. I have at times changed opinions that were important to me, when someone showed me I was wrong",category: 2),
        QuizModel(question: "7. I am willing to change my position on an important issue in the face of good reasons.",category: 2),
        QuizModel(question: "8. I am open to revising my important beliefs in the face of new information.",category: 2),
        QuizModel(question: "9. I am willing to change my opinions on the basis of compelling reason.",category: 2),
        QuizModel(question: "10. I’m willing to change my mind once it’s made up about an important topic.",category: 2),
        QuizModel(question: "11. I respect that there are ways of making important decisions that are different from the way I make decisions.",category: 3),
        QuizModel(question: "12. Listening to perspectives of others seldom changes my important opinions.",category: 4),
         QuizModel(question: "13. I welcome different ways of thinking about important topics.",category: 3),
         QuizModel(question: "14. I can have great respect for someone, even when we don't see eye-to-eye on important topics",category: 3),
         QuizModel(question: "15. Even when I disagree with others, I can recognize that they have sound points",category: 3),
         QuizModel(question: "16. When someone disagrees with ideas that are important to me, it feels as though I'm  being attacked.",category: 1),
         QuizModel(question: "17. When someone contradicts my most important beliefs, it feels like a personal attack.",category: 1),
         QuizModel(question: "18. I tend to feel threatened when others disagree with me on topics that are close to  my heart.*",category: 1),
         QuizModel(question: "19. I can respect others, even if I disagree with them in important ways. ", category: 3),
         QuizModel(question: "20. I am willing to hear others out, even if I disagree with them. ",category: 3),
         QuizModel(question: "21. When someone disagrees with ideas that are important to me, it makes me feel insignificant.", category: 1),
         QuizModel(question: "22. I feel small when others disagree with me on topics that are close to my heart.", category: 1)]
                 
        
    }
         static var scoreOptions: [ScoreOption]{
            [ScoreOption(id: 1, score: "1"), ScoreOption(id: 2, score: "2"), ScoreOption(id: 3, score: "3"), ScoreOption(id: 4, score: "4"), ScoreOption(id: 5, score: "5")]
        }
}


//extension AppViewModel{
//    static var quizData: [[QuizModel], ScoreOption] { [QuizModel(question: "My ideas are usually better than other people’s ideas.", scoreOption: [ScoreOption(id: 1, score: "1"),ScoreOption(id: 2, score: "3")]),
//                                 QuizModel(question: "What is Isaac?", scoreOption: [ScoreOption(id: 2, score: "2"),ScoreOption(id: 1, score: "0")])
//    ]
//    }
//}
