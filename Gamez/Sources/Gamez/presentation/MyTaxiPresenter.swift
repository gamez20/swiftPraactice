import Foundation

class MyTaxiPresente{

    static let instance:MyTaxiPresente = MyTaxiPresente()
    let dataService:MyTaxiDataService = MyTaxiDataService.instance


    init(){
        dataService.dataDefault()
    }

    func taxiDriversData() -> Array<TaxiDriver>{
        return dataService.getTaxiDrivers()
    }
    
    func driverSearch(_ number:Int ) -> TaxiDriver{

        return dataService.getTaxiDriver(number)

    }

    func randomNumber() -> Int {
        return Int.random(in:1...15)
    }

    func calculateAverageTaxiDriver(_ sumQualifier:Int ,_ qualifyTaxiDriver:Int) -> Int {

        return  sumQualifier / qualifyTaxiDriver
    }

    func numberOfTaxiDrivers() -> Int{
        return (dataService.getnumberTaxiDrivers() - 1)
    }
}