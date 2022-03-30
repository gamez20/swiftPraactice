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
                    let answers = getAnswers(question.correctAnswer,question.incorrectAnswers)
                    let letters: [String] = ["a","b","c","d","e"]
                    var register:[String:String] = ["a":" ", "b":" ", "c":" ", "d":" "]
                    var numberLetters = 0

                    for answer in answers{
                        let letter = letters[numberLetters]
                        register[letter] = answer
                        print("\(letter). \(answer)")
                        numberLetters += 1
                    }

                    let response = String(readLine()!)

                    if validateResponse(question,register,response){
                        print("Correct")
                    }else{
                        print("Incorrect")
                    }

                    numberQuestion += 1
                    readLine()
                }
                // for question in questions {
                //     print("\(question.type) -> \(question.question)")
                //     print(question.incorrectAnswers)
                // } 
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

    func validateResponse(_ answer:UIQuestionData,_ register:[String:String],_ response:String ) -> Bool {

        if answer.correctAnswer != register[response]{
            return false
        }
        return true
    }

    func cleanConsole(){
        print("\u{1B}[1;1H", "\u{1B}[2J")
    }
}