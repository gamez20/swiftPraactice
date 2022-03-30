import Foundation
import FoundationNetworking

class MillionaireDataService{
    static let instance:MillionaireDataService = MillionaireDataService()
    let userDefaults = UserDefaults.standard


    func getQuestionsAndAnswers(onCompletion:@escaping CallbackBlock<UIQuestionData>){

        guard let url:URL = URL(string: "https://opentdb.com/api.php?amount=10&type=multiple") else {return}
        var request = URLRequest(url:url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request){ data,response,error in
            guard let data = data else { return }
            do{
                let decodeData = try JSONDecoder().decode(QuizData.self,from: data)
                
                var questions: [UIQuestionData] = []
                for result in decodeData.results{

                    let type = result.type
                    let difficulty = result.difficulty
                    let question = result.question
                    let correctAnswer = result.correct_answer
                    let incorrectAnswers = result.incorrect_answers

                    let questionData = UIQuestionData(type:type,difficulty:difficulty,question:question,correctAnswer:correctAnswer,incorrectAnswers:incorrectAnswers)
                    
                    questions.append(questionData)
                }
                
                // onCompletion(decodeData.results)

                onCompletion(questions)

            }catch{
                print("****Faild****")
                print(error)
            }
        }
        task.resume()

    }

/*
    func saveQuestion(_ question:QuestionData){

        do {
            let data = try JSONEncoder().encode(question)
            userDefaults.set(data,forKey: "savedSession")
        } catch  {
            print("Unable to encode question \(error)")
        }


    }
    */
}