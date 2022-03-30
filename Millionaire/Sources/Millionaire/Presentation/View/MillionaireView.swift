import Foundation

class MillionaireView{
    static let instance:MillionaireView = MillionaireView()
    let millionairePresenter:MillionairePresenter = MillionairePresenter.instance

    func start(){
        mainMenuView()
    }

    func mainMenuView(){

        millionairePresenter.getQuestionsAndAnswers(onCompletion:{quizData in
            print(quizData)
        })

      

        // for san in quest {
        //     print(san)
        // }

        readLine()
          let quest = millionairePresenter.getquestion()
          for vas in quest {
              print("\(vas.type) -> \(vas.question)")
              print(vas.incorrect_answers)
          }        
          
        

        print(millionairePresenter.getnumber())

        readLine()
        /*
        print("Who wants to be a millionaire?")
        print("1.Play\n2.Leave")

        switch Int(readLine()!)! {
            case 1:
                print("jugando")
                
            default:
                print("bye!")
        }
        */
    }




    func cleanConsole(){
        print("\u{1B}[1;1H", "\u{1B}[2J")
    }
}