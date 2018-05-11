//
//  PersonFlightViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/27/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit

var personFlight:String?

class PersonFlightViewController: UIViewController {

    @IBOutlet weak var numOfpersonFlight: UITextField!
    
    
    
    
    @IBAction func toBookDetailFlight(_ sender: UIButton) {
        
        let num:Int = Int(numOfpersonFlight.text!)!
        
        if (num < 5){
            
            personFlight = numOfpersonFlight.text
            
            
            performSegue(withIdentifier: "toBookFlightDetail", sender: self)
            
            
        } else {
            let alertController = UIAlertController(title: "Sorry!", message:
                "Maximum 4 People allowed", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
            
            
        }
       
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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