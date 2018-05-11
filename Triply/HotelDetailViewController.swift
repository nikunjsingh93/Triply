//
//  HotelDetailViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/23/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit


class HotelDetailViewController: UIViewController {

    
    @IBOutlet weak var hotelNameLabel: UILabel!
    
    @IBOutlet weak var HotelCityLabel: UILabel!
    
    @IBOutlet weak var hotelPriceLabel: UILabel!
    
    @IBOutlet weak var hotelCurrLabel: UILabel!
    
    @IBOutlet weak var hotelLine1Label: UILabel!
    
    @IBOutlet weak var hotelPostalLabel: UILabel!
    

    
    
    @IBAction func toRooms(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toRooms", sender: self)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        hotelNameLabel.text = hotelName
        
        HotelCityLabel.text = hotelCity
        
        hotelPriceLabel.text = hotelPrice
        
        hotelCurrLabel.text = hotelcurr
        
        hotelLine1Label.text = hotelline1
        
        hotelPostalLabel.text = hotelpostal

        self.hideKeyboard()

        
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


