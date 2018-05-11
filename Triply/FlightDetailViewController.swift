//
//  FlightDetailViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/24/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit

class FlightDetailViewController: UIViewController {
    
    @IBOutlet weak var airlineNameLabel: UILabel!
    
    @IBOutlet weak var airlineOrgLabel: UILabel!
    
    @IBOutlet weak var airlineDestLabel: UILabel!
    
    @IBOutlet weak var airlineDateLabel: UILabel!
    
    @IBOutlet weak var airlinePriceLabel: UILabel!
    
    @IBOutlet weak var airlineCurrencyLabel: UILabel!
    
    
    @IBAction func tobookFlightBtn(_ sender: UIButton) {
        
        
        performSegue(withIdentifier: "toFlightPersons", sender: self)
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        airlineNameLabel.text! = flightName!
        
         airlinePriceLabel.text! = flightPrice!
        
          airlineOrgLabel.text! = flightOrg!
        
        airlineDestLabel.text! = flightDest!
        
        airlineDateLabel.text! =  flightDate!
        
        airlineCurrencyLabel.text! = flightCurrency!

        
        
        
        
        
        
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
