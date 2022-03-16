import Foundation

class TaxiDriver {
    var identification: Int
    var name: String
    var lastName: String
    var telephone: Int  
    var carModel:String
    var score:Int
    var numberTrips:Int
    var sumQualifier:Int

    init(identification: Int, name: String,lastName: String,
        telephone: Int ,carModel:String,score:Int,numberTrips:Int , sumQualifier:Int){
        self.identification = identification
        self.name = name
        self.lastName = lastName
        self.telephone = telephone
        self.carModel = carModel
        self.score = score
        self.numberTrips = numberTrips
        self.sumQualifier = sumQualifier
    }           

}
