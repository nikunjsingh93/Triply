//
//  THDetailsViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/27/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit

class THDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var hotelnamelabel: UILabel!
    
    
    @IBOutlet weak var citylabel: UILabel!
    
    
    @IBOutlet weak var pricelabel: UILabel!
    
    
    @IBOutlet weak var currencylabel: UILabel!
    
    @IBOutlet weak var addresslabel: UILabel!
    
    
    @IBOutlet weak var postallabel: UILabel!
    
    @IBOutlet weak var personslabel: UILabel!
    
    
    @IBOutlet weak var booklabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
     citylabel.text = hotelCityBOOKED
        
      pricelabel.text = hotelPriceBOOKED
        
       hotelnamelabel.text = hotelNameBOOKED
        
      currencylabel.text = hotelcurrBOOKED
        
      addresslabel.text = hotelline1BOOKED
        
       postallabel.text = hotelpostalBOOKED
        
       booklabel.text = hotelbookidBOOKED
        
      personslabel.text = hotelpersonBOOKED
    
        
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
