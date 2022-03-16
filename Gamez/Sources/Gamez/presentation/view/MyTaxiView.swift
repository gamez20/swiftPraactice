import Foundation

class MyTaxiView{
    // static let instance:Mytaxicontroller = Mytaxicontroller()
    // constructor
 
    // let dataService = MyTaxiPresente()
    

    static let instance:MyTaxiView = MyTaxiView()
    // let dataService:dataService = dataService.instance
    let dataService:MyTaxiDataService = MyTaxiDataService.instance

    func start(){
         var opcionExit:String
         var optionSelected:String
        repeat{
            printData("--Welcome to TaxiApp--\n!You want To Do!!\n1. Taxi \n2. Support") 
            optionSelected = requestOption()

            switch optionSelected {

                case "1":
                    loadSubmenu()
                case "2":
                        printData("Support is not available yet\npress any key + enter to go back")
                default:
                    printData("bye !")
            }

            printData("Do you want to register another taxi? yes or not")
            opcionExit = requestOption()
        }while(opcionExit != "not")
    }


    func loadSubmenu(){

        let pickupPoint:String
        let detinyPoint:String
        // var taxiDriverSelected:TaxiDriver

        printData("1. Call a taxi\n2. Back")
        switch requestOption() {
            case "1":
                printData("Address A")
                pickupPoint = requestOption()

                printData("Address B")
                detinyPoint = requestOption()

                if !(pickupPoint.isEmpty && detinyPoint.isEmpty) {

                   let taxiDriverSelected : TaxiDriver
                   let numberTaxiDriver:Int?

                   taxiDriverShow()
                   printData("Select driver")
                   numberTaxiDriver = Int(requestOption())
            
                    if (numberTaxiDriver! - 1) <= dataService.getnumberTaxiDrivers(){

                        taxiDriverSelected = dataService.getTaxiDriver(numberTaxiDriver ?? 0)
                        print("taxi driver \(taxiDriverSelected.name) selected")
                        timeTravel()
                        scoreTaxiDriver(taxiDriverSelected)
                    }
                    else{
                        print("taxi driver with the number \(numberTaxiDriver!) does not exist")
                        loadSubmenu()
                    }
                    

                }else {
                    print("Empty Fields")
                    loadSubmenu()
                }


            default:
                start()

        }

    }

    func scoreTaxiDriver(_ taxiDriverSelected:TaxiDriver) {

        printData("Qualify Taxi Driver From 0 to 5")  
        let qualifyTaxiDriver = Int(readLine()!)!
        let minRantingNumber = 0
        let maxRantingNumber = 5
        let isQualifyValidate = qualifyTaxiDriver <= maxRantingNumber && qualifyTaxiDriver >= minRantingNumber

        if isQualifyValidate {
            
            taxiDriverSelected.numberTrips += 1 
            taxiDriverSelected.sumQualifier += qualifyTaxiDriver
            taxiDriverSelected.score = calculateAverageTaxiDriver(taxiDriverSelected.sumQualifier,taxiDriverSelected.numberTrips)

        }else{
            print("enter a grade from 0 to 5")
            scoreTaxiDriver(taxiDriverSelected)
        }
    }




    func timeTravel(){
        let time:Int = randomNumber()
        // var timer=Timer()
        print("\(time) Minutes")
        print("time in process .....................")
        /*
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in 
            	print("timer fired!")
            	timer.invalidate()
       	}
        */

    }
/*
    @objc func fire(){
        count+=1
        print(count)
    }
    */
    func taxiDriverShow(){

        let taxiDrivers = dataService.getTaxiDrivers()
        var taxiDriverNumber = 1
        for taxiDriver in taxiDrivers{
            printData("\(taxiDriverNumber) - \(taxiDriver.name) -> Score: \(taxiDriver.score) -> Travels \(taxiDriver.numberTrips) ")
            taxiDriverNumber+=1
        }  

    }

    func randomNumber() -> Int {
        return Int.random(in:1...15)
    }

    func calculateAverageTaxiDriver(_ sumQualifier:Int ,_ qualifyTaxiDriver:Int) -> Int {

        return  sumQualifier / qualifyTaxiDriver
    }

    func requestOption()->String{
        return readLine()!
    }

    func printData(_ data:String){
        print(data)
    }


}