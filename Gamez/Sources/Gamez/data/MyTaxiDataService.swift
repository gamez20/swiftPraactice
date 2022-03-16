import Foundation   

class MyTaxiDataService{
    static let instance:MyTaxiDataService = MyTaxiDataService()
    var taxiDrivers = [TaxiDriver]()

    init(){
                     
        taxiDrivers =
                    [
                        TaxiDriver(identification : 123467,name : "Diana Maria", lastName : "Guerra",  telephone : 73837494,carModel : "toyota123",score : 0,numberTrips : 0 , sumQualifier: 0),                    
                        TaxiDriver(identification : 123485,name : "santiago",    lastName : "gamez",   telephone : 53837494,carModel : "Prado123",score : 0,numberTrips : 0 , sumQualifier: 0),
                        TaxiDriver(identification : 123427,name : "Carlos",      lastName : "Arturo",  telephone : 63837494,carModel : "BMW123",score : 0,numberTrips : 0 , sumQualifier: 0),
                        TaxiDriver(identification : 123492,name : "Juan Pablo",  lastName : "Motato",  telephone : 83837494,carModel : "CLIO123",score : 0,numberTrips : 0 , sumQualifier: 0),
                        TaxiDriver(identification : 123453,name : "Nicolas",     lastName : "Cardenas",telephone : 23837494,carModel : "RAPTOR123",score : 0,numberTrips : 0 , sumQualifier: 0),
                        TaxiDriver(identification : 123435,name : "Luis Carlos", lastName : "Gamez",   telephone : 63837494,carModel : "COURSA123",score : 0,numberTrips : 0 , sumQualifier: 0),
                        TaxiDriver(identification : 123495,name : "Kevyn",       lastName : "Gallego", telephone : 33837494,carModel : "COURBET123",score : 0,numberTrips : 0 , sumQualifier: 0),
                        TaxiDriver(identification : 123457,name : "victor",      lastName : "Osorio",  telephone : 43837494,carModel : "DIMAX123",score : 0,numberTrips : 0 , sumQualifier: 0),
                        TaxiDriver(identification : 123458,name : "Sandra Milea",lastName : "Cardenas",telephone : 83837494,carModel : "CAMARO123",score : 0,numberTrips : 0 , sumQualifier: 0),
                        TaxiDriver(identification : 123454,name : "Juan",        lastName : "Restrepo",telephone : 63837494,carModel : "JEEP123",score : 0,numberTrips : 0 , sumQualifier: 0)
                    ]
    }

    func getTaxiDrivers() -> Array<TaxiDriver>{
        return self.taxiDrivers
    }

    func getTaxiDriver(_ number:Int) -> TaxiDriver {

        return self.taxiDrivers[number-1]
    }

    func getnumberTaxiDrivers() -> Int{
        return self.taxiDrivers.count
    }

}