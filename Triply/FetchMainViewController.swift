//
//  FetchMainViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/27/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


var hnameArray=[String]()
var hcityArray=[String]()
var hcurrencyArray=[String]()
var hline1Array=[String]()
var hpersonsArray=[String]()
var hpostalArray=[String]()
var hpriceArray=[String]()
var hidArray=[String]()




var fnameArray=[String]()
var fdateArray=[String]()
var fcurrencyArray=[String]()
var fdestArray=[String]()
var forgArray=[String]()
var fpersonsArray=[String]()
var fpriceArray=[String]()
var fidArray=[String]()







class FetchMainViewController: UIViewController {
    
    var ref: DatabaseReference!

    
    
    @IBAction func searchBookedHotels(_ sender: UIButton) {
        
        
        performSegue(withIdentifier: "toFetchHotel", sender: self)
        
    }
    
  
    @IBAction func searchBookedFlights(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toFetchFlight", sender: self)
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        hnameArray=[String]()
        hcityArray=[String]()
        hcurrencyArray=[String]()
        hline1Array=[String]()
        hpersonsArray=[String]()
        hpostalArray=[String]()
        hpriceArray=[String]()
        hidArray=[String]()
        
        
        fnameArray=[String]()
        fdateArray=[String]()
        fcurrencyArray=[String]()
        fdestArray=[String]()
        forgArray=[String]()
        fpersonsArray=[String]()
        fpriceArray=[String]()
        fidArray=[String]()

        
        
        ref = Database.database().reference().child(USERUID!);

        
        
        ref.child("Hotels").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            
            for hotels in snapshot.children.allObjects as! [DataSnapshot] {
                //getting values
                
                
                
               
                
                
                let hotelsObject = hotels.value as? [String: AnyObject]
                let hotelName  = hotelsObject?["HotelName"]
                let hotelcity  = hotelsObject?["HotelCity"]
                let hotelcurr  = hotelsObject?["HotelCurrency"]
                let hotelline1  = hotelsObject?["HotelLine1"]
                let hotelpersons  = hotelsObject?["HotelPersons"]
                let hotelpostal  = hotelsObject?["HotelPostal"]
                let hotelprice  = hotelsObject?["HotelPrice"]
                let hotelid  = hotelsObject?["HotelBookID"]


                
                hnameArray.append(hotelName as! String)
                hcityArray.append(hotelcity as! String)
                hcurrencyArray.append(hotelcurr as! String)
                hline1Array.append(hotelline1 as! String)
                hpersonsArray.append(hotelpersons as! String)
                hpostalArray.append(hotelpostal as! String)
                hpriceArray.append(hotelprice as! String)
                hidArray.append(hotelid as! String)

                

                print(hnameArray)
                print(hcityArray)
                print(hcurrencyArray)
                print(hline1Array)
                print(hpersonsArray)
                print(hpostalArray)
                print(hpriceArray)
                print(hidArray)


                
            }
            
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
        
        
        ref.child("Flights").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            
            for flights in snapshot.children.allObjects as! [DataSnapshot] {
                
           
                
                
                //getting values
                let flightsObject = flights.value as? [String: AnyObject]
                let fcurrency  = flightsObject?["FlightCurrency"]
                let fdate  = flightsObject?["FlightDate"]
                let fdest  = flightsObject?["FlightDest"]
                let fname  = flightsObject?["FlightName"]
                let fpersons  = flightsObject?["FlightPersons"]
                let fprice  = flightsObject?["FlightPrice"]
                let forigin  = flightsObject?["FlightOrigin"]
                let fid  = flightsObject?["FlightBookID"]

                
                
             
                fnameArray.append(fname as! String)
                fdateArray.append(fdate as! String)
                fcurrencyArray.append(fcurrency as! String)
                fdestArray.append(fdest as! String)
                forgArray.append(forigin as! String)
                fpersonsArray.append(fpersons as! String)
                fpriceArray.append(fprice as! String)
                fidArray.append(fid as! String)
                

                print(fnameArray)
                print(fdateArray)
                print(fcurrencyArray)
                print(fdestArray)
                print(forgArray)
                print(fpersonsArray)
                print(fpriceArray)
                print(fidArray)

                
                
            }
            
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
        
        

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
