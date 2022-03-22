import Foundation

typealias CallbackBlock <T:Any> = (_ value:[T])->Void


class CatPresenter{
   
    static let instance:CatPresenter = CatPresenter()
    let dataService:CatDataService = CatDataService.instance
    var breedsLibrary = [Cat]()
    var initialLetterBreeds = [Character]()

    func loadBreeds(){
        dataService.getBreeds(onCompletion:{
                cats in self.addBreedLibrary(cats)
        })
    }

    func getCats()-> Array<Cat>{
        // return dataService.getCats()
        return self.breedsLibrary
    }

    func addBreedLibrary(_ cats:[Cat]){
        self.breedsLibrary = cats
        addInitialLetterBreeds(breedsLibrary)
    }

    func numberBreedsInLibrary() -> Int{
        return breedsLibrary.count
    }

    func addInitialLetterBreeds(_ breedsLibrary:[Cat]){
        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var initialLetterBreed:Character

        for letter in alphabet {
            for breed in self.breedsLibrary{  
                let nameBreed = breed.name  
                initialLetterBreed = letterInitial(sentence:nameBreed)
                if letter == initialLetterBreed{
                   self.initialLetterBreeds.append(letter)
                   break     
                }
            }
        }
    }

    func getinitialLetterBreeds() -> Array<Character>{
        return self.initialLetterBreeds
    }

    func letterInitial(sentence:String)->Character{
        return Character(String(sentence[sentence.startIndex]))
    }

    func getBreedsByInitialSelected(letterSelected:Character) -> Array<Cat>{

        var breedsFilter = [Cat]()
        var initialLetterBreed:Character

        for breed in self.breedsLibrary {
            initialLetterBreed = letterInitial(sentence:breed.name)
            if initialLetterBreed == letterSelected {
                breedsFilter.append(breed)
            }
        }

        return breedsFilter
    }


}