import Foundation

typealias CallbackBlock<T:Any> = (_ value:[T])->Void
typealias ErrorBlock = (_ error:Error)->Void

class CatPresenter{

    static let instance:CatPresenter = CatPresenter()
    let dataService:CatDataService = CatDataService.instance

    func getAllBreeds(onCompletion:@escaping CallbackBlock<Cat>/*, onError:ErrorBlock?*/){
        
        dataService.getBreeds(onCompletion:{
                cats in onCompletion(cats)
        }/*,onError:onError*/)
            

    }






}