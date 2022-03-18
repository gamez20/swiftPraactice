import Foundation

typealias CallbackBlock <T:Any> = (_ value:[T])->Void
typealias ErrorBlock = (_ error:Error)->Void

class CatPresenter{
   
    static let instance:CatPresenter = CatPresenter()
    let dataService:CatDataService = CatDataService.instance
    var lista = [Cat]()
    func getAllBreeds(onCompletion:@escaping CallbackBlock<Cat>, onError:ErrorBlock?){
        
        dataService.getBreeds(onCompletion:{
                cats in onCompletion(cats)
        },onError:onError)
        

    }

    func getCats()-> Array<Cat>{
        // return dataService.getCats()
        return self.lista
    }
/*
    func addcat(_ cats:[Cat]) -> [Cat]{

        for cat in cats{
            self.lista.append(cat)
        }
        return self.lista
    }
*/




}