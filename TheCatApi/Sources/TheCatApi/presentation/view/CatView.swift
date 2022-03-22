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
        
            print("Welcome to TheApiCat\n1.Initial letters of Breeds\n2.Breeds Library")
            switch readLine()! {
            case "1":
                        InitialLettersOfTheBreeds()
            case "2":
                        let listCats = catPresenter.getCats()

                        // let count = catPresenter.getNumberCats()
                        var count = 0
                        for i  in listCats {
                            print("\(i.name) -> origin: \(i.origin)")
                            count += 1
                        }

                        print("\(count)")

            default:
                menu()
            }

   

    }

    func InitialLettersOfTheBreeds(){
        let letters = catPresenter.getinitialLetterBreeds()
        for letter  in letters {
            print(letter)
        }

        searchBreedInitialLetter()
    }

    func searchBreedInitialLetter(){
        print("Select a letter")

        let letterSelected = Character(readLine()!)

        let breedsByInitialSelected = catPresenter.getBreedsByInitialSelected(letterSelected:letterSelected)

        if !(breedsByInitialSelected.isEmpty == false) {
            print("There are no breeds with this initial")
        }else{
            for breeds in breedsByInitialSelected {
                print(breeds.name)
            }
        }

 
    }

}