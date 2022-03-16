import Foundation

class MyTaxiView{
    // static let instance:Mytaxicontroller = Mytaxicontroller()
    // constructor
 
    // let myTaxiPresenter = MyTaxiPresente()
    

    static let instance:MyTaxiView = MyTaxiView()
    let myTaxiPresenter:MyTaxiPresente = MyTaxiPresente.instance

    func pageload(){
         var opcionExit:String
         var optionSelected:String
        repeat{
            printData("--Welcome to TaxiApp--\n!You want To Do!!\n1. Taxi \n2. Support") 
            optionSelected = requestOption()

            switch optionSelected {

                case "1":
                    loadsubmenu()
                case "2":
                        printData("Support is not available yet\npress any key + enter to go back")
                default:
                    printData("bye !")
            }

            printData("Do you want to register another taxi? yes or not")
            opcionExit = requestOption()
        }while(opcionExit != "not")
    }


    func loadsubmenu(){

        let addressA:String
        let addressB:String
        // var taxiDriverSelected:TaxiDriver

        printData("1. Call a taxi\n2. Back")
        switch requestOption() {
            case "1":
                printData("Address A")
                addressA = requestOption()

                printData("Address B")
                addressB = requestOption()

                if !(addressA.isEmpty && addressB.isEmpty) {

                   let taxiDriverSelected : TaxiDriver
                   let numberTaxiDriver:Int?

                   taxiDriverShow()
                   printData("Select driver")
                   numberTaxiDriver = Int(requestOption())
            
                    if (numberTaxiDriver! - 1) <= myTaxiPresenter.numberOfTaxiDrivers(){

                        taxiDriverSelected = myTaxiPresenter.driverSearch(numberTaxiDriver ?? 0)
                        print("taxi driver \(taxiDriverSelected.name) selected")
                        timeTravel()
                        scoreTaxiDriver(taxiDriverSelected)
                    }
                    else{
                        print("taxi driver with the number \(numberTaxiDriver!) does not exist")
                        loadsubmenu()
                    }
                    

                }else {
                    print("Empty Fields")
                    loadsubmenu()
                }


            default:
                pageload()

        }

    }

    func scoreTaxiDriver(_ taxiDriverSelected:TaxiDriver) {

        printData("Qualify Taxi Driver From 0 to 5")  
        let qualifyTaxiDriver = Int(requestOption())
        let minRantingNumber=0
        let maxRantingNumber=5
        
        if qualifyTaxiDriver! <= maxRantingNumber && qualifyTaxiDriver! >= minRantingNumber{
            
            taxiDriverSelected.numberTrips += 1 
            taxiDriverSelected.sumQualifier += qualifyTaxiDriver ?? 0
            taxiDriverSelected.score = myTaxiPresenter.calculateAverageTaxiDriver(
                                                                                    taxiDriverSelected.sumQualifier,
                                                                                    taxiDriverSelected.numberTrips
                                                                                )
        }else{
            print("enter a grade from 0 to 5")
            scoreTaxiDriver(taxiDriverSelected)
        }
    }




    func timeTravel(){
        let time:Int = myTaxiPresenter.randomNumber()
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

        let taxiDrivers = myTaxiPresenter.taxiDriversData()
        var count = 1
        for taxiDriver in taxiDrivers{
            printData("\(count) - \(taxiDriver.name) -> Score: \(taxiDriver.score) -> Travels \(taxiDriver.numberTrips) ")
            count+=1
        }  

    }




    func requestOption()->String{
        return readLine()!
    }

    func printData(_ data:String){
        print(data)
    }


}