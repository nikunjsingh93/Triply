//
//  HomeViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/17/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit
import FirebaseAuth
import SearchTextField



var destHotelTemp:String?

var destHotelFromDateTemp:String?

var destHotelToDateTemp:String?




var fromFlightCityTemp:String?

var toFlightCityTemp:String?

var waylightTemp:String?

var startFlightDateTemp:String?

var endFlightDateTemp:String?




var flightNameArray = [String]()

var flightPriceArray = [String]()


var flightDeptDateArray = [String]()


var flightOriginArray = [String]()


var flightDestArray = [String]()

var currencyFlight:String?





class HomeViewController: UIViewController {
    
    var temp:String = "true"

    
    @IBAction func flightwaySegmentCont(_ sender: UISegmentedControl) {
        
        
        switch sender.selectedSegmentIndex {
        case 0:
            print("OneWay")
            temp = "true"
        case 1:
            print("TwoWay")
            
            temp = "false"
        default:
            print("3")
        }
        
        
    }
    
    @IBOutlet weak var startDateFlight: UIDatePicker!
    @IBOutlet weak var endDateFlight: UIDatePicker!
    
    @IBAction func toSearchFlights(_ sender: UIButton) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        
        endDateFlight.minimumDate = Date().tomorrow
        
        
        startDateFlight.minimumDate = Date()
        
        
        endDateFlight.datePickerMode = UIDatePickerMode.date
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "yyyy-MM-dd"
        let selectedDate = dateFormatter1.string(from: endDateFlight.date)
        
        
        startDateFlight.datePickerMode = UIDatePickerMode.date
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "yyyy-MM-dd"
        let selectedDate2 = dateFormatter2.string(from: startDateFlight.date)
        
        
        endFlightDateTemp = selectedDate
        
        startFlightDateTemp =  selectedDate2
        
        
        getJsonFromUrlFLIGHTS()
        
        
    }
    
    @IBOutlet weak var fromCityFlightText: SearchTextField!
    
    @IBOutlet weak var toCityFlightText: SearchTextField!
    
    
    
    
    @IBAction func textChangeFrom(_ sender: SearchTextField) {
        
        
        
        fromCityFlightText.filterStrings(["Mumbai", "Delhi", "New York", "Boston", "London", "Los Angeles","Chicago", "San Francisco", "Denver","Las Vegas","Atlanta","Charlotte","Miami","Houston","Washington, D.C.","Phoenix","Pune","Paris","Singapore","Rome","Sydney","Dublin","Kuala Lumpur","Seattle","Tokyo","Berlin","Seoul","Dubai","Hong Kong","Madrid","Toronto"])
        
        
        
        
    }
    
    
    
    @IBAction func textChangeTo(_ sender: SearchTextField) {
        
        

        toCityFlightText.filterStrings(["Mumbai", "Delhi", "New York", "Boston", "London", "Los Angeles","Chicago", "San Francisco", "Denver","Las Vegas","Atlanta","Charlotte","Miami","Houston","Washington, D.C.","Phoenix","Pune","Paris","Singapore","Rome","Sydney","Dublin","Kuala Lumpur","Seattle","Tokyo","Berlin","Seoul","Dubai","Hong Kong","Madrid","Toronto"])
        
        
    }
    
    
    
    
    @IBAction func nextToFlightDates(_ sender: UIButton) {
        
        
        
        if (fromCityFlightText.text! == "Mumbai"){
            
            fromCityFlightText.text! = "BOM"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            
            tosearchFlights()
            
            
        } else if (fromCityFlightText.text! == "Delhi"){
            
            fromCityFlightText.text! = "DEL"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            
            tosearchFlights()
            
        } else if (fromCityFlightText.text! == "New York"){
            
            fromCityFlightText.text! = "JFK"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            
            tosearchFlights()
            
        } else if (fromCityFlightText.text! == "Boston"){
            
            fromCityFlightText.text! = "BOS"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            
            tosearchFlights()
            
        } else if (fromCityFlightText.text! == "London"){
            
            fromCityFlightText.text! = "LHR"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
            
        }else if (fromCityFlightText.text! == "Los Angeles"){
            
            fromCityFlightText.text! = "LAX"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
          
            
        }else if (fromCityFlightText.text! == "Chicago"){
            
            fromCityFlightText.text! = "ORD"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
        tosearchFlights()

            
        }else if (fromCityFlightText.text! == "San Francisco"){
            
            fromCityFlightText.text! = "SFO"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
         
            
        }else if (fromCityFlightText.text! == "Denver"){
            
            fromCityFlightText.text! = "DEN"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
           
            
        }else if (fromCityFlightText.text! == "Atlanta"){
            
            fromCityFlightText.text! = "ATL"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
            
        }else if (fromCityFlightText.text! == "Las Vegas"){
            
            fromCityFlightText.text! = "LAS"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
            
        

        }else if (fromCityFlightText.text! == "Charlotte"){
            
            fromCityFlightText.text! = "CLT"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
          

            
        }else if (fromCityFlightText.text! == "Miami"){
            
            fromCityFlightText.text! = "MIA"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
          

        }else if (fromCityFlightText.text! == "Houston"){
            
            fromCityFlightText.text! = "IAH"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            
         tosearchFlights()

        }else if (fromCityFlightText.text! == "Washington, D.C."){
            
            fromCityFlightText.text! = "DCA"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
           

        }else if (fromCityFlightText.text! == "Phoenix"){
            
            fromCityFlightText.text! = "PHX"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
          
            
        }else if (fromCityFlightText.text! == "Pune"){
            
            fromCityFlightText.text! = "PNQ"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
            
         

        }else if (fromCityFlightText.text! == "Paris"){
            
            fromCityFlightText.text! = "CDG"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
            

        }else if (fromCityFlightText.text! == "Singapore"){
            
            fromCityFlightText.text! = "SIN"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            
             tosearchFlights()
            
        }else if (fromCityFlightText.text! == "Rome"){
            
            fromCityFlightText.text! = "FCO"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
            
        }else if (fromCityFlightText.text! == "Sydney"){
            
            fromCityFlightText.text! = "SYD"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()

            
        }else if (fromCityFlightText.text! == "Dublin"){
            
            fromCityFlightText.text! = "DUB"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
            

        }else if (fromCityFlightText.text! == "Kuala Lumpur"){
            
            fromCityFlightText.text! = "KUL"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()

            
        }else if (fromCityFlightText.text! == "Seattle"){
            
            fromCityFlightText.text! = "SEA"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            
             tosearchFlights()
            
        }else if (fromCityFlightText.text! == "Tokyo"){
            
            fromCityFlightText.text! = "HND"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
            
        }else if (fromCityFlightText.text! == "Berlin"){
            
            fromCityFlightText.text! = "TXL"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()

            
        }else if (fromCityFlightText.text! == "Seoul"){
            
            fromCityFlightText.text! = "ICN"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            
            tosearchFlights()
            
        }else if (fromCityFlightText.text! == "Dubai"){
            
            fromCityFlightText.text! = "DXB"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            
            tosearchFlights()
        }else if (fromCityFlightText.text! == "Hong Kong"){
            
            fromCityFlightText.text! = "HKG"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            tosearchFlights()
            
        }else if (fromCityFlightText.text! == "Madrid"){
            
            fromCityFlightText.text! = "MAD"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            
            tosearchFlights()
        }else if (fromCityFlightText.text! == "Toronto"){
            
            fromCityFlightText.text! = "YYZ"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            
            tosearchFlights()
            
        }else if (fromCityFlightText.text! == "Dallas"){
            
            fromCityFlightText.text! = "DFW"
            
            fromFlightCityTemp = fromCityFlightText.text!
            
            fromCityFlightText.text! = ""
            
            tosearchFlights()
            
        } else {
            
            let alertController = UIAlertController(title: "Sorry!", message:
                "We Dont Support this city yet", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        
        
        
      
    
    
        
        
    }
    
    
    
    func tosearchFlights(){
        
        
        if (toCityFlightText.text! == "Mumbai"){
            
            toCityFlightText.text! = "BOM"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        } else if (toCityFlightText.text! == "Delhi"){
            
            toCityFlightText.text! = "DEL"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
            
        } else if (toCityFlightText.text! == "New York"){
            
            toCityFlightText.text! = "JFK"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
        } else if (toCityFlightText.text! == "Boston"){
            
            toCityFlightText.text! = "BOS"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
        } else if (toCityFlightText.text! == "London"){
            
            toCityFlightText.text! = "LHR"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        }else if (toCityFlightText.text! == "Los Angeles"){
            
            toCityFlightText.text! = "LAX"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        }else if (toCityFlightText.text! == "Chicago"){
            
            toCityFlightText.text! = "ORD"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        }else if (toCityFlightText.text! == "San Francisco"){
            
            toCityFlightText.text! = "SFO"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        }else if (toCityFlightText.text! == "Denver"){
            
            toCityFlightText.text! = "DEN"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
        }else if (toCityFlightText.text! == "Atlanta"){
            
            toCityFlightText.text! = "ATL"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
        }else if (toCityFlightText.text! == "Las Vegas"){
            
            toCityFlightText.text! = "LAS"
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        }else if (toCityFlightText.text! == "Charlotte"){
            
            toCityFlightText.text! = "CLT"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
            
        }else if (toCityFlightText.text! == "Miami"){
            
            toCityFlightText.text! = "MIA"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        }else if (toCityFlightText.text! == "Houston"){
            
            toCityFlightText.text! = "IAH"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

        }else if (toCityFlightText.text! == "Washington, D.C."){
            
            toCityFlightText.text! = "DCA"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        }else if (toCityFlightText.text! == "Phoenix"){
            
            toCityFlightText.text! = "PHX"
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        }else if (toCityFlightText.text! == "Pune"){
            
            toCityFlightText.text! = "PNQ"
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
            
        }else if (toCityFlightText.text! == "Paris"){
            
            toCityFlightText.text! = "CDG"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        }else if (toCityFlightText.text! == "Singapore"){
            
            toCityFlightText.text! = "SIN"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        }else if (toCityFlightText.text! == "Rome"){
            
            toCityFlightText.text! = "FCO"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

        }else if (toCityFlightText.text! == "Sydney"){
            
            toCityFlightText.text! = "SYD"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
        }else if (toCityFlightText.text! == "Dublin"){
            
            toCityFlightText.text! = "DUB"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        }else if (toCityFlightText.text! == "Kuala Lumpur"){
            
            toCityFlightText.text! = "KUL"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
        }else if (toCityFlightText.text! == "Seattle"){
            
            toCityFlightText.text! = "SEA"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        }else if (toCityFlightText.text! == "Tokyo"){
            
            toCityFlightText.text! = "HND"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
        }else if (toCityFlightText.text! == "Berlin"){
            
            toCityFlightText.text! = "TXL"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
        }else if (toCityFlightText.text! == "Seoul"){
            
            toCityFlightText.text! = "ICN"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        }else if (toCityFlightText.text! == "Dubai"){
            
            toCityFlightText.text! = "DXB"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
        }else if (toCityFlightText.text! == "Hong Kong"){
            
            toCityFlightText.text! = "HKG"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
        }else if (toCityFlightText.text! == "Madrid"){
            
            toCityFlightText.text! = "MAD"
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
        }else if (toCityFlightText.text! == "Toronto"){
            
            toCityFlightText.text! = "YYZ"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        }else if (toCityFlightText.text! == "Dallas"){
            
            toCityFlightText.text! = "DFW"
            
            toFlightCityTemp = toCityFlightText.text!
            
            toCityFlightText.text! = ""
            
            waylightTemp = temp
            
            
            performSegue(withIdentifier: "toSelectDateFlight", sender: self)

            
            
        } else {
            
            let alertController = UIAlertController(title: "Sorry!", message:
                "We Dont Support this city yet", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "logout", sender: self)
        
    }
    
    func getJsonFromUrl(){
        //creating a NSURL
        
        var URL_H = "https://api.sandbox.amadeus.com/v1.2/hotels/search-airport?apikey=TNUL27HsWgQHfb4j4W5Wr8am0mkU1CD6&location=\(destHotelTemp!)&check_in=\(destHotelFromDateTemp!)&check_out=\(destHotelToDateTemp!)"
        
        print(URL_H)
        
        let url = NSURL(string: URL_H)
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            
            nameArray = [String]()
            
            cityArray = [String]()
            
            priceArray = [String]()
            
            
            
            
            currencyArray = [String]()
            
            countryArray = [String]()
            
            line1Array = [String]()
            
            postalArray = [String]()
            
            phoneArray = [String]()
            
            
        
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
               
                //getting the avengers tag array from json and converting it to NSArray
                if let heroeArray = jsonObj!.value(forKey: "results") as? NSArray {
                    //looping through all the elements
                    for heroe in heroeArray{
                        
                        
                        
                        //converting the element to a dictionary
                        if let heroeDict = heroe as? NSDictionary {
                            
                            
                            
    
                            //getting the name from the dictionary
                            if let name = heroeDict.value(forKey: "property_name") {
                                
                                //adding the name to the array
                                nameArray.append((name as? String)!)
                            }
                            
                            if  let n = heroeDict.value(forKey: "location") {
                                
                                if let name1 = (n as AnyObject).value(forKey: "latitude") {
                                    
                                    //adding the name to the array
                                    latArray.append((name1 as? Double)!)
                                }
                            }
                            
                            if  let n = heroeDict.value(forKey: "location") {
                                
                                if let name1 = (n as AnyObject).value(forKey: "longitude") {
                                    
                                    //adding the name to the array
                                    lonArray.append((name1 as? Double)!)
                                }
                            }
                            
                            if  let n = heroeDict.value(forKey: "address") {
                                
                                if let name1 = (n as AnyObject).value(forKey: "city") {
                                    
                                    //adding the name to the array
                                    cityArray.append((name1 as? String)!)
                                }
                            }
                            
                            if  let n = heroeDict.value(forKey: "address") {
                                
                                if let name1 = (n as AnyObject).value(forKey: "line1") {
                                    
                                    //adding the name to the array
                                    line1Array.append((name1 as? String)!)
                                }
                            }
                            
                            if  let n = heroeDict.value(forKey: "address") {
                                
                                if let name1 = (n as AnyObject).value(forKey: "postal_code") {
                                    
                                    //adding the name to the array
                                    postalArray.append((name1 as? String)!)
                                }
                            }
                            
                            if  let n = heroeDict.value(forKey: "address") {
                                
                                if let name1 = (n as AnyObject).value(forKey: "country") {
                                    
                                    //adding the name to the array
                                    countryArray.append((name1 as? String)!)
                                }
                            }
                            
                            if  let n = heroeDict.value(forKey: "total_price") {
                                
                                if let name1 = (n as AnyObject).value(forKey: "amount") {
                                    
                                    //adding the name to the array
                                    priceArray.append((name1 as? String)!)
                                }
                            }
                            
                            if  let n = heroeDict.value(forKey: "total_price") {
                                
                                if let name1 = (n as AnyObject).value(forKey: "currency") {
                                    
                                    //adding the name to the array
                                    currencyArray.append((name1 as? String)!)
                                }
                            }
                            
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    //calling another function after fetching the json
                    //it will show the names to label
                    self.showNames()
                })
            }
        }).resume()
    }
    
    func showNames(){
        //looing through all the elements of the array
        for name in nameArray{
            
            //appending the names to label
            //            labelTest.text = labelTest.text! + name + "\n";
            print(name)
        }
        
        for name1 in latArray{
            
            //appending the names to label
            //            labelTest.text = labelTest.text! + name + "\n";
            print("lat\(name1)")
        }
        
        for name1 in lonArray{
            
            //appending the names to label
            //            labelTest.text = labelTest.text! + name + "\n";
            print("lon\(name1)")
        }
        
        for name1 in cityArray{
            
            //appending the names to label
            //            labelTest.text = labelTest.text! + name + "\n";
            print("city\(name1)")
        }
        
        for name1 in priceArray{
            
            //appending the names to label
            //            labelTest.text = labelTest.text! + name + "\n";
            print("price\(name1)")
        }
        
        for name1 in currencyArray{
            
            //appending the names to label
            //            labelTest.text = labelTest.text! + name + "\n";
            print("currency:\(name1)")
        }
        
        for name1 in countryArray{
            
            //appending the names to label
            //            labelTest.text = labelTest.text! + name + "\n";
            print("country:\(name1)")
        }
        
        for name1 in line1Array{
            
            //appending the names to label
            //            labelTest.text = labelTest.text! + name + "\n";
            print("line 1:\(name1)")
        }
        
        for name1 in postalArray{
            
            //appending the names to label
            //            labelTest.text = labelTest.text! + name + "\n";
            print("postal code:\(name1)")
        }
        
        for name1 in phoneArray{
            
            //appending the names to label
            //            labelTest.text = labelTest.text! + name + "\n";
            print("Phone :\(name1)")
        }
        
        performSegue(withIdentifier: "toSearchHotel", sender: self)

    }
    
    
    
    
    // --------------------------------------------------------------------------------
    
    
    
    
    
    
    func getJsonFromUrlFLIGHTS(){
        //creating a NSURL
        
        
    
        var URL_H2 = "https://api.sandbox.amadeus.com/v1.2/flights/extensive-search?apikey=TNUL27HsWgQHfb4j4W5Wr8am0mkU1CD6&origin=\(fromFlightCityTemp!)&destination=\(toFlightCityTemp!)&departure_date=\(startFlightDateTemp!)--\(endFlightDateTemp!)&one-way=\(waylightTemp!)"
        
//         var URL_H2 = "https://api.sandbox.amadeus.com/v1.2/flights/extensive-search?apikey=TNUL27HsWgQHfb4j4W5Wr8am0mkU1CD6&origin=FRA&destination=LON&departure_date=2018-07-20--2018-07-22&one-way=true"
        
        print(URL_H2)
        
        let url = NSURL(string: URL_H2)
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            
            flightNameArray = [String]()
            
            flightPriceArray = [String]()
            
            flightDeptDateArray = [String]()
            
            
            flightOriginArray = [String]()
            
            
            flightDestArray = [String]()
            
            currencyFlight = ""

            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                
                
                if let h = jsonObj!.value(forKey: "currency") {
                    
                    
                    
                    currencyFlight = h as! String
                    
                    


                }
                
                

                
                //getting the avengers tag array from json and converting it to NSArray
                if let heroeArray = jsonObj!.value(forKey: "results") as? NSArray {
                    
                    
    
                    //looping through all the elements
                    for heroe in heroeArray{
                        
                        //converting the element to a dictionary
                        if let heroeDict = heroe as? NSDictionary {
                            
                            //getting the name from the dictionary
                            if let name = heroeDict.value(forKey: "destination") {
                                
                                //adding the name to the array
                                flightDestArray.append((name as? String)!)
                            }
                            
                            if  let n = heroeDict.value(forKey: "departure_date") {
                                
                                
                                    //adding the name to the array
                                    flightDeptDateArray.append((n as? String)!)
                                
                            }
                            
                            if  let n1 = heroeDict.value(forKey: "price") {
                                
                                
                                    //adding the name to the array
                                    flightPriceArray.append((n1 as? String)!)
                                
                            }
                            
                            if  let n2 = heroeDict.value(forKey: "airline") {
                                
                                
                                    //adding the name to the array
                                    flightNameArray.append((n2 as? String)!)
                                
                            }
                            
                         
                            
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    //calling another function after fetching the json
                    //it will show the names to label
                    self.showNames1()
                })
            }
        }).resume()
    }
    
    func showNames1(){
        //looing through all the elements of the array
        for name in flightDestArray{
            
            //appending the names to label
            //            labelTest.text = labelTest.text! + name + "\n";
            print(name)
        }
        
        for name1 in flightDeptDateArray{
            
            //appending the names to label
            //            labelTest.text = labelTest.text! + name + "\n";
            print("dept date:\(name1)")
        }
        
        for name1 in flightPriceArray{
            
            //appending the names to label
            //            labelTest.text = labelTest.text! + name + "\n";
            print("price:\(name1)")
        }
        
        for name1 in flightNameArray{
            
            //appending the names to label
            //            labelTest.text = labelTest.text! + name + "\n";
            print("Airline:\(name1)")
        }
        
        
        print("Currenvy:\(currencyFlight!)")

        
        performSegue(withIdentifier: "toSearchFlights", sender: self)
        
    }
    @IBOutlet weak var hotelDestLabel: UILabel!
    
    @IBOutlet weak var toHotelDate: UIDatePicker!
    
    @IBOutlet weak var fromHotelDate: UIDatePicker!
    
    
    @IBAction func toSearchHotels(_ sender: UIButton) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        
        toHotelDate.minimumDate = Date().tomorrow
        
        
        fromHotelDate.minimumDate = Date()
        
        
        toHotelDate.datePickerMode = UIDatePickerMode.date
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "yyyy-MM-dd"
        let selectedDate = dateFormatter1.string(from: toHotelDate.date)
        
        
        fromHotelDate.datePickerMode = UIDatePickerMode.date
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "yyyy-MM-dd"
        let selectedDate2 = dateFormatter2.string(from: fromHotelDate.date)
        
        
        destHotelToDateTemp = selectedDate
        
        destHotelFromDateTemp =  selectedDate2
        
        
        getJsonFromUrl()

        
        
        

    }
    
    
    
    
    @IBOutlet weak var SearchHDes: SearchTextField!
    
 
    @IBAction func textchange(_ sender: Any) {
        
        
        SearchHDes.filterStrings(["Mumbai", "Delhi", "New York", "Boston", "London", "Los Angeles","Chicago", "San Francisco", "Denver","Las Vegas","Atlanta","Charlotte","Miami","Houston","Washington, D.C.","Phoenix","Pune","Paris","Singapore","Rome","Sydney","Dublin","Kuala Lumpur","Seattle","Tokyo","Berlin","Seoul","Dubai","Hong Kong","Madrid","Toronto"])
        
        
    }
    
    @IBAction func gotodate(_ sender: UIButton) {
        
        if (SearchHDes.text! == "Mumbai"){
            
            SearchHDes.text! = "BOM"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            
            performSegue(withIdentifier: "selectDateHotel", sender: self)



        } else if (SearchHDes.text! == "Delhi"){
            
            SearchHDes.text! = "DEL"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)


            
        } else if (SearchHDes.text! == "New York"){
            
            SearchHDes.text! = "JFK"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        } else if (SearchHDes.text! == "Boston"){
            
            SearchHDes.text! = "BOS"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        } else if (SearchHDes.text! == "London"){
            
            SearchHDes.text! = "LHR"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        } else if (SearchHDes.text! == "Los Angeles"){
            
            SearchHDes.text! = "LAX"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Chicago"){
            
            SearchHDes.text! = "ORD"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "San Francisco"){
            
            SearchHDes.text! = "SFO"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Denver"){
            
            SearchHDes.text! = "DEN"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Atlanta"){
            
            SearchHDes.text! = "ATL"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            
            performSegue(withIdentifier: "selectDateHotel", sender: self)

        }else if (SearchHDes.text! == "Las Vegas"){
            
            SearchHDes.text! = "LAS"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            
            performSegue(withIdentifier: "selectDateHotel", sender: self)

        }else if (SearchHDes.text! == "Charlotte"){
            
            SearchHDes.text! = "CLT"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Miami"){
            
            SearchHDes.text! = "MIA"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            
            performSegue(withIdentifier: "selectDateHotel", sender: self)

        }else if (SearchHDes.text! == "Houston"){
            
            SearchHDes.text! = "IAH"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            
            performSegue(withIdentifier: "selectDateHotel", sender: self)

        }else if (SearchHDes.text! == "Washington, D.C."){
            
            SearchHDes.text! = "DCA"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            
            performSegue(withIdentifier: "selectDateHotel", sender: self)

        }else if (SearchHDes.text! == "Phoenix"){
            
            SearchHDes.text! = "PHX"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Pune"){
            
            SearchHDes.text! = "PNQ"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            
            performSegue(withIdentifier: "selectDateHotel", sender: self)

        }else if (SearchHDes.text! == "Paris"){
            
            SearchHDes.text! = "CDG"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            
            performSegue(withIdentifier: "selectDateHotel", sender: self)

        }else if (SearchHDes.text! == "Singapore"){
            
            SearchHDes.text! = "SIN"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Rome"){
            
            SearchHDes.text! = "FCO"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            
            performSegue(withIdentifier: "selectDateHotel", sender: self)

        }else if (SearchHDes.text! == "Sydney"){
            
            SearchHDes.text! = "SYD"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Dublin"){
            
            SearchHDes.text! = "DUB"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            
            performSegue(withIdentifier: "selectDateHotel", sender: self)

        }else if (SearchHDes.text! == "Kuala Lumpur"){
            
            SearchHDes.text! = "KUL"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Seattle"){
            
            SearchHDes.text! = "SEA"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Tokyo"){
            
            SearchHDes.text! = "HND"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            
            performSegue(withIdentifier: "selectDateHotel", sender: self)

        }else if (SearchHDes.text! == "Berlin"){
            
            SearchHDes.text! = "TXL"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Seoul"){
            
            SearchHDes.text! = "ICN"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Dubai"){
            
            SearchHDes.text! = "DXB"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Hong Kong"){
            
            SearchHDes.text! = "HKG"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Madrid"){
            
            SearchHDes.text! = "MAD"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Toronto"){
            
            SearchHDes.text! = "YYZ"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            performSegue(withIdentifier: "selectDateHotel", sender: self)

            
        }else if (SearchHDes.text! == "Dallas"){
            
            SearchHDes.text! = "DFW"
            
            destHotelTemp = SearchHDes.text!
            
            SearchHDes.text! = ""
            
            performSegue(withIdentifier: "selectDateHotel", sender: self)

        } else {
            
            let alertController = UIAlertController(title: "Sorry!", message:
                "We Dont Support this city yet", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        
       

 
        
    }
    
    
    
    
    
    @IBOutlet weak var welcomelabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Auth.auth().currentUser?.email!)
        
       
        self.hideKeyboard()
        
        
        
//        let welcome = Auth.auth().currentUser?.email!
        
//        welcomelabel.text = "Hi, \(welcome!)"
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Date {
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
}


