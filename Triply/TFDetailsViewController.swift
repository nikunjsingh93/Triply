//
//  TFDetailsViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/27/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit

class TFDetailsViewController: UIViewController {

    
    @IBOutlet weak var flightnamelabel: UILabel!
    
    @IBOutlet weak var orglabel: UILabel!
    
    @IBOutlet weak var destlabel: UILabel!
    
    @IBOutlet weak var datelabel: UILabel!
    
    @IBOutlet weak var pricelabel: UILabel!
    
    @IBOutlet weak var currlabel: UILabel!
    
    @IBOutlet weak var booklabel: UILabel!
    
    
    @IBOutlet weak var persons: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        flightnamelabel.text=flightNameBOOKED
        
        pricelabel.text=flightPriceBOOKED
        
        orglabel.text = flightOrgBOOKED
        
        destlabel.text=flightDestBOOKED
        
        datelabel.text=flightDateBOOKED
        
        currlabel.text=flightCurrencyBOOKED
        
        booklabel.text=flightbookidBOOKED
        
       persons.text = flightpersonsBOOKED
        
        
    

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
