//
//  SearchFlightsTableViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/24/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit


var flightName:String?

var flightPrice:String?

var flightOrg:String?

var flightDest:String?

var flightDate:String?

var flightCurrency:String?





class FlightTableViewCell: UITableViewCell {
    
    @IBOutlet weak var originFlightLabel: UILabel!
    
    @IBOutlet weak var destFlightLabel: UILabel!
    
    @IBOutlet weak var dateFlightLabel: UILabel!
    
    @IBOutlet weak var priceFlightLabel: UILabel!
    
    @IBOutlet weak var currencyFlightLabel: UILabel!
    
}


class SearchFlightsTableViewController: UITableViewController,UISearchBarDelegate,UINavigationControllerDelegate {

    
    @IBOutlet var tableViewFlights: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableViewFlights.reloadData()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        tableViewFlights.reloadData()
        tableViewFlights.delegate = self
        
        tableViewFlights.dataSource = self
        
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
        
        if(flightNameArray.count==0){
            
            
            let alertController = UIAlertController(title: "Sorry!", message:
                "No Flights Available", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
            
        }
        
        return flightNameArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> FlightTableViewCell {
        
         var cell : FlightTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FlightTableViewCell

        
        
            
            
            
            let fruitName = fromFlightCityTemp
            cell.originFlightLabel?.text = fruitName
            
            let fruitName2 = flightDestArray[indexPath.row]
            cell.destFlightLabel?.text = fruitName2
            
            
            let fruitName3 = flightDeptDateArray[indexPath.row]
            cell.dateFlightLabel?.text = fruitName3
            
            
            let fruitName4 = flightPriceArray[indexPath.row]
            cell.priceFlightLabel?.text = fruitName4
            
            
            let fruitName5 = currencyFlight
            cell.currencyFlightLabel?.text = fruitName5
            
            

        
        
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
        flightName = flightNameArray[indexPath.row]
        
        flightPrice = flightPriceArray[indexPath.row]
        
        flightOrg = fromFlightCityTemp
        
        flightDest = flightDestArray[indexPath.row]
        
        flightDate = flightDeptDateArray[indexPath.row]
        
        flightCurrency = currencyFlight

        
        performSegue(withIdentifier: "toFlightDetail", sender: self)
        
        
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
