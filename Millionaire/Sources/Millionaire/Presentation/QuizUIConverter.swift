import Foundation

struct UIQuestionData{
    var type: String
    var difficulty: String
    var question: String
    var correctAnswer: String
    var incorrectAnswers: [String]
}

class QuizUIConverter{

    func convert(_ questions: [QuestionData]) -> [UIQuestionData]{
        return questions.map({ question in 
                return converQuestions(question)
        })
    }

    func converQuestions(_ question:QuestionData) -> UIQuestionData{
      print(question.type)
        let type = question.type
        let difficulty = question.difficulty
        let question = question.question
        let correctAnswer = question.correct_answer
        let incorrectAnswers = question.incorrect_answers

        return UIQuestionData(type:type, difficulty:difficulty,
                            question:question,correctAnswer:correctAnswer,incorrectAnswers:incorrectAnswers)
    }

}
