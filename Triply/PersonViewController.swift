//
//  PersonViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/27/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit

var perHotelTemp:String?


class PersonViewController: UIViewController {
    
    @IBOutlet weak var personText: UITextField!
    
    
    @IBAction func toBookDetsils(_ sender: UIButton) {
        
        let num:Int = Int(personText.text!)!
        
        if (num < 5){
            
            perHotelTemp = personText.text
            
            performSegue(withIdentifier: "toBookHotels", sender: self)
            
            
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
