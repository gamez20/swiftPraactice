import Foundation

typealias CallbackBlock <T:Any> = (_ value:[T])->Void

let convert:QuizUIConverter = QuizUIConverter()



class MillionairePresenter{
    static let instance:MillionairePresenter = MillionairePresenter()
    let dataService:MillionaireDataService = MillionaireDataService.instance
    var questions : [QuestionData] = []

    func getQuestionsAndAnswers(onCompletion:@escaping CallbackBlock<QuestionData>){

        dataService.getQuestionsAndAnswers(onCompletion:{ quizData in 
            // onCompletion(quizData)
            self.addquestion(converter.convert(quizData))  
        })

    }


    func addquestion(_ questions:[QuestionData]){
        self.questions = questions
    }

    func getnumber()-> Int {
        return self.questions.count
    }

    func getquestion() -> [QuestionData]{
        return self.questions
    }

}