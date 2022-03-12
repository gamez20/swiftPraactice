import Foundation

class MyTaxiPresente{
    static let instance:MyTaxiPresente = MyTaxiPresente()

    func homesub1(_ activeIntf:String)-> String {
      
        if activeIntf == "1"{
             return "1. Call a taxi\n2. Back"
        }
       return "Support is not available yet\npress any key + enter to go back"
    }

    func homesub2(_ activeIntf:String)-> String {
    
        if activeIntf == "1"{
                return "A taxi will come to your home soon!\nApp finished."
        }
        return "press back"
    }


    
}