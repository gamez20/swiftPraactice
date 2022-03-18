import Foundation

class CatView{
    static let instance:CatView = CatView()
    let catPresenter:CatPresenter = CatPresenter.instance

    func start(){
        
/*
        let palabra = "hola"

        print("\(palabra.count)")
        print(palabra[palabra.startIndex])
*/
        catPresenter.getAllBreeds(onCompletion:{ cats in 
            print(cats)
        },onError:{error in print(error)})

/*
        var data = readLine()

        let listCats = catPresenter.getCats()

        for i  in listCats {
            print("\(i.name) -> origin: \(i.origin)")
        }
*/
    }

    

}