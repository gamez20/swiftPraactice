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
                let lettersOpcion: [String] = ["a","b","c","d","e"]
                var numberQuestion = 1

                for question in questions {
                    cleanConsole()
                    print("\(numberQuestion). \(question.question)")
                    print(" ")
                    let answers = getAnswers(question.correctAnswer,question.incorrectAnswers)
                    
                    var answerOpcions:[String:String] = ["a":" ", "b":" ", "c":" ", "d":" "]
                    var numberLetters = 0

                    for answer in answers{
                        let letter = lettersOpcion[numberLetters]
                        answerOpcions[letter] = answer
                        print("   \(letter). \(answer)")
                        numberLetters += 1
                    }

                    let response = String(readLine()!)
                    let isAnswerCorrect = validateResponse(question,answerOpcions,response)
                    if isAnswerCorrect {
                        print("Correct")
                    }else{
                        print("Incorrect")
                    }

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

    func validateResponse(_ answer:UIQuestionData,_ registerQuestion:[String:String],_ response:String ) -> Bool {

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