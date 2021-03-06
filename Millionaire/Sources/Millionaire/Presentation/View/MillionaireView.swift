import Foundation

class MillionaireView{
    static let instance:MillionaireView = MillionaireView()
    let millionairePresenter:MillionairePresenter = MillionairePresenter.instance

    func start(){
        millionairePresenter.loadQuestions()
        mainMenuView()
    }

    func mainMenuView(){

        print("Who wants to be a millionaire?")
        print("1.Play\n2.Leave")

        switch Int(readLine()!)! {
            case 1:
                readLine()
                let questions = millionairePresenter.getquestion()
                var numberQuestion = 1

                for question in questions {
                    cleanConsole()
                    print("\(numberQuestion). \(question.question)")
                    print(" ")

                    let answerOptions = showOptions(question)
                    showAnswer(question,answerOptions)
                    numberQuestion += 1
                    readLine()
                }

                readLine()
                
            default:
                print("bye!")
        }

    }

    func getAnswers(_ correctAnswer:String,_ incorrectAnswers: [String]) -> [String]{
        var answers: [String] = []
        answers.append(correctAnswer)
        for incorrectAnswer in incorrectAnswers{
            answers.append(incorrectAnswer)
        }
        answers.shuffle()
        return answers
    }

    func showAnswer(_ question:UIQuestionData,_ answerOpcions:[String:String]){
        let option = String(readLine()!)

        if isAnswerCorrect(question,answerOpcions,option) {
            print("Correct Answer")
        }else{
            print("Incorrect Answer")
        }
    }

    func showOptions(_ question:UIQuestionData) -> [String:String]{
        let lettersOpcion: [String] = ["a","b","c","d","e"]
        let answers = getAnswers(question.correctAnswer,question.incorrectAnswers)
        var answerOpcions:[String:String] = ["a":" ", "b":" ", "c":" ", "d":" "]
        var numberLetters = 0
        for answer in answers{
            let letter = lettersOpcion[numberLetters]
            answerOpcions[letter] = answer
            print("   \(letter). \(answer)")
            numberLetters += 1
        }

        return answerOpcions
    }

    func isAnswerCorrect(_ answer:UIQuestionData,_ registerQuestion:[String:String],_ response:String ) -> Bool {

        let correctAnswer = answer.correctAnswer 
        let selectedAnswer = registerQuestion[response]

        if correctAnswer != selectedAnswer {
            return false
        }
        return true
    }

    func cleanConsole(){
        print("\u{1B}[1;1H", "\u{1B}[2J")
    }
}