//
//  BookHotelViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/27/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit

import Firebase


var bookidh:String?



class BookHotelViewController: UIViewController {

    
    @IBOutlet weak var hotelNameBookLabel: UILabel!
    
    @IBOutlet weak var hotelCityBookLabel: UILabel!
    
    @IBOutlet weak var hotelPriceBookLabel: UILabel!
    
    @IBOutlet weak var hotelcurrBookLabel: UILabel!
    
    @IBOutlet weak var hotelline1BookLabel: UILabel!
    
    @IBOutlet weak var hotelpostalBookLabel: UILabel!
    
    @IBOutlet weak var hotelPersonBookLabel: UILabel!
    
    

    
    @IBAction func toCongratsHotel(_ sender: UIButton) {
        
        
        let refreshAlert = UIAlertController(title: "Confirm", message: "You are booking this Hotel", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Book", style: .default, handler: { (action: UIAlertAction!) in
            
            self.addTicket()
    
            self.performSegue(withIdentifier: "toBooked", sender: self)
            
            print("Handle Ok logic here")
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            
            
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
       
        
    }
    
    
    
    var ref: DatabaseReference!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        hotelNameBookLabel.text = hotelName
        
        hotelCityBookLabel.text = hotelCity
        
        hotelPriceBookLabel.text = hotelPrice
        
        hotelcurrBookLabel.text = hotelcurr
        
        hotelline1BookLabel.text = hotelline1
        
        hotelpostalBookLabel.text = hotelpostal
        
        hotelPersonBookLabel.text = perHotelTemp
        
        
        self.hideKeyboard()
        
        
    
        ref = Database.database().reference().child(USERUID!);
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func addTicket(){
        
        bookidh = String(arc4random_uniform(1000000000))

        
        
        let key = ref.childByAutoId().key
        
        let tickets = ["HotelName": hotelName,
                      "HotelCity": hotelCity,
                      "HotelPrice": hotelPrice,
                      "HotelCurrency": hotelcurr,
                      "HotelLine1": hotelline1,
                      "HotelPostal": hotelpostal,
                      "HotelPersons": perHotelTemp,
                      "HotelBookID": bookidh,

                      
                      
                      ] as [String : Any]
        
        ref.child("Hotels").child(key).setValue(tickets)
        

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
