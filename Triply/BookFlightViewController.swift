//
//  BookFlightViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/27/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit

import Firebase

var bookidf:String?



class BookFlightViewController: UIViewController {

    @IBOutlet weak var airlineBookName: UILabel!
    
    
    @IBOutlet weak var airlineOrgBookName: UILabel!
    
    
    
    @IBOutlet weak var airlineDestBookLabel: UILabel!
    
    
    @IBOutlet weak var airlineDateBookLabel: UILabel!
    
    @IBOutlet weak var airlinePriceBookLabel: UILabel!
    
    
    @IBOutlet weak var numPerFlightLabel: UILabel!
    
    
    
    
    @IBAction func toFinallyBookedFlight(_ sender: UIButton) {
        
        
        let refreshAlert = UIAlertController(title: "Confirm", message: "You are booking this Flight", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Book", style: .default, handler: { (action: UIAlertAction!) in
            
            self.addTicketFlight()
            
            self.performSegue(withIdentifier: "toBookedFlight", sender: self)
            
            print("Handle Ok logic here")
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            
            
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
        
    }
    
    
    
    @IBOutlet weak var airlinecurrBookLabel: UILabel!
    
    
    
    var ref: DatabaseReference!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        airlineBookName.text! = flightName!
        
        airlinePriceBookLabel.text! = flightPrice!
        
        airlineOrgBookName.text! = flightOrg!
        
        airlineDestBookLabel.text! = flightDest!
        
        airlineDateBookLabel.text! =  flightDate!
        
        numPerFlightLabel.text! = personFlight!

        airlinecurrBookLabel.text! = flightCurrency!
        
        
        ref = Database.database().reference().child(USERUID!);

        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTicketFlight(){
        
        
        
        bookidf = String(arc4random_uniform(1000000000))
        
        
        let key = ref.childByAutoId().key
        
        let tickets = ["FlightName": flightName,
                       "FlightPrice": flightPrice,
                       "FlightOrigin": flightOrg,
                       "FlightDest": flightDest,
                       "FlightDate": flightDate,
                       "FlightPersons": personFlight,
                       "FlightCurrency": flightCurrency,
                       "FlightBookID": bookidf,

                       
                       ] as [String : Any]
        
        ref.child("Flights").child(key).setValue(tickets)
        
        
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
