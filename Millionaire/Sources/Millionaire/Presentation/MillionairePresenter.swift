import Foundation

typealias CallbackBlock <T:Any> = (_ value:[T])->Void

// let convert:QuizUIConverter = QuizUIConverter()



class MillionairePresenter{
    static let instance:MillionairePresenter = MillionairePresenter()
    let dataService:MillionaireDataService = MillionaireDataService.instance
    var questions : [UIQuestionData] = []

    func loadQuestions(){

        dataService.getQuestionsAndAnswers(onCompletion:{ quizData in 
            // onCompletion(quizData)
            self.addquestion(quizData)  
        })
    }


    func addquestion(_ questions:[UIQuestionData]){
        self.questions = questions
    }

    func totalQuestions()-> Int {
        return self.questions.count
    }

    func getquestion() -> [UIQuestionData]{
        return self.questions
    }

}