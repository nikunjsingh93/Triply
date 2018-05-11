//
//  SeachHotelsTableViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/23/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit

var nameArray = [String]()

var latArray = [Double]()

var lonArray = [Double]()

var cityArray = [String]()

var priceArray = [String]()


var currencyArray = [String]()

var countryArray = [String]()

var line1Array = [String]()

var postalArray = [String]()

var phoneArray = [String]()





var hotelCity:String?

var hotelPrice:String?

var hotelName:String?

var hotelcurr:String?

var hotelline1:String?

var hotelpostal:String?





class HotelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hotelNameCell: UILabel!
    
    @IBOutlet weak var hotelPriceCell: UILabel!
    
    @IBOutlet weak var hotelCurrencyCell: UILabel!
    
}


class SeachHotelsTableViewController: UITableViewController, UISearchBarDelegate,UINavigationControllerDelegate {

    
    
    @IBOutlet var hotelTableView: UITableView!
    
//    @IBOutlet weak var searchHotelsBar: UISearchBar!
    
    
    var temp = [String]()
    
    var temp2 = [String]()

    
    
    var inSearchMode = false
    

 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        searchHotelsBar.delegate = self
        
        
//        searchHotelsBar.returnKeyType = UIReturnKeyType.done
        
        
        
        
        
        hotelTableView.reloadData()
        
        


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        hotelTableView.reloadData()
        hotelTableView.delegate = self
        
        hotelTableView.dataSource = self
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        
        if(nameArray.count == 0){
            
            let alertController = UIAlertController(title: "Sorry!", message:
                "No Hotels Available", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
            
            
        }

        
            return nameArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> HotelTableViewCell {
        
        var cell : HotelTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HotelTableViewCell
        

        
        
        
        
            
            let fruitName = nameArray[indexPath.row]
            cell.hotelNameCell?.text = fruitName
            
            let fruitName2 = priceArray[indexPath.row]
            cell.hotelPriceCell?.text = fruitName2
            
            
            let fruitName3 = currencyArray[indexPath.row]
            cell.hotelCurrencyCell?.text = fruitName3
            
            
        
        
        
        

        
        
        return cell
    }

    

    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
      
        
        hotelCity = cityArray[indexPath.row]
        
        hotelPrice = priceArray[indexPath.row]
        
        hotelName = nameArray[indexPath.row]
        
        hotelcurr = currencyArray[indexPath.row]
        
        hotelline1 = line1Array[indexPath.row]
        
        hotelpostal = postalArray[indexPath.row]
        
        
        performSegue(withIdentifier: "toHotelDetail", sender: self)
        
        
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
