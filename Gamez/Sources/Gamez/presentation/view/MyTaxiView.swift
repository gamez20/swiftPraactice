import Foundation

class MyTaxiView{
    // static let instance:Mytaxicontroller = Mytaxicontroller()
    // constructor
    let myTaxiPresenter = MyTaxiPresente()
   
    var opc=""
    func pageload(){

        printData("1. Taxi \n2. Support") 
        switch readLineData() {

            case "1":
                   loadsubmenu()
            case "2":
                    printData("Support is not available yet\npress any key + enter to go back")
                

            default:
                printData("bye !")
        }
        
    }


    func loadsubmenu(){
        
        printData("1. Call a taxi\n2. Back")
        switch readLineData() {
        case "1":
            printData("A taxi will come to your home soon!\nApp finished.")

        default:
            pageload()
        }

    }

    func readLineData()->String{
        return readLine()!
    }

    func printData(_ data:String){
        print(data)
    }


}