import Foundation

/*
1-Persistir localmente las razas de gatos.1

2-Pedir al usuario que escoja una letra de la lista de iniciales de los gatos. 
  En la lista no debe haber letras repetidas en caso de haber dos razas con la misma inicial.

3-Cuando el cliente escoja una letra, mostrar en pantalla todas las razas correspondientes a esa letra.

*/

class CatView{
    static let instance:CatView = CatView()
    let catPresenter:CatPresenter = CatPresenter.instance

    func start(){
        catPresenter.loadBreeds()
        menu()
    }


    func menu(){
    
        // let result = tipoDispositivo(width: 12, height: 12)
        // print(result.0)
        

        print("Welcome to TheApiCat\n1.Initial letters of Breeds\n2.Breeds Library\n3.The Cat Breed Battle")
        switch readLine()! {
        case "1":
                InitialLettersOfTheBreeds()
                searchBreedInitialLetter()
        case "2":
                breedsLibrary()
        
        case "3":
                voteView()
        default:
            menu()
        }
   
    }

    func cleanConsole(){
        print("\u{1B}[1;1H", "\u{1B}[2J")
    }

    func breedsLibrary(){
        let listCats = catPresenter.getCats()
        for cat  in listCats {
            print("\(cat.name) -> origin: \(cat.origin)" )  
        }
    }

    func InitialLettersOfTheBreeds(){
        
        let letters = catPresenter.getinitialLetterBreeds()
        for letter  in letters {
            print(letter)
        }
    }

    func searchBreedInitialLetter(){
        print("Select a letter")
        let letterSelected = Character(readLine()!.uppercased())
        let breedsByInitialSelected = catPresenter.getBreedsByInitialSelected(letterSelected:letterSelected)

        if !(breedsByInitialSelected.isEmpty == false) {
            print("There are no breeds with this initial")
        }else{

            for breeds in breedsByInitialSelected {
                print(breeds.name)
            }
        }

 
    }
    //
    func voteView(){
        cleanConsole()
       repeat{ 
            
            print("The Cat Breed Battle\n1.Vote\n2.Voted List\n3.Breeds")
            switch readLine()! {
                case "1":
                    var exit:Bool = true
                    while exit {
                        let breedCat = catPresenter.voteCat()
                        cleanConsole()
                        print("******************** The Cat Breed Battle *******************")
                        print("\(breedCat.name)")
                        print("Selected Option\n0.Dislike 1.Like 2.Leave")

                        switch Int(readLine()!) {
                            case 0:
                                // let AdditionDislike += + 
                                catPresenter.addVotes(idImage:breedCat.reference_image_id ?? "" , vote: 0)

                            case 1:
                                catPresenter.addVotes(idImage:breedCat.reference_image_id ?? "" , vote: 1)

                            default:
                                exit = false
                        } 

        
                    }
        
                case "2":
                    print("VotedList")
                    let breeds = catPresenter.getCats()
                    var countVotes = 0
                    var votesLike=0 , votesDislike = 0
                    catPresenter.getVotes(onCompletion:{ votes in 
                        print(votes[19])

                       for breed in breeds {

                           for vote in votes {
                               if(breed.reference_image_id == vote.image_id){
                                   if(vote.value == 0){
                                       votesDislike += 1
                                   }else if vote.value == 1{
                                       votesLike += 1
                                   }
                               }
                           }

                            print("Breed: \(breed.name)\nLike: \(votesLike) Dislike:\(votesDislike)")

                       }




                        // for res in rs {
                        //     print(res.image_id)
                            
                        // }
                        // print(rs.count)
                        
                    })
   
                    
                    
                    readLine()
                case "3":
                    let breedsAnDescriptions = catPresenter.getCats()

                    for breedAnDescription in breedsAnDescriptions {
                        print("name :\(breedAnDescription.name)\ndescription:\(breedAnDescription.description) ")
                        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
                    }
                    

                default:
                    voteView()
            }
        print("Back menu The battle")
       }while valuOpcion(opcion: readLine()!)
           
       


    }

    func valuOpcion(opcion:String)-> Bool{

        if(opcion == "yes"){
            return true
        }
        return false
    }

    func tipoDispositivo(width:Float, height:Float) -> (Int, String) {
        return (3, "i")
    }


}