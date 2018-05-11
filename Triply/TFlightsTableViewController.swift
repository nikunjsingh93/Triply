//
//  TFlightsTableViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/27/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit




var flightNameBOOKED:String?

var flightPriceBOOKED:String?

var flightOrgBOOKED:String?

var flightDestBOOKED:String?

var flightDateBOOKED:String?

var flightCurrencyBOOKED:String?

var flightbookidBOOKED:String?

var flightpersonsBOOKED:String?




class FlightTableViewCellBOOKED: UITableViewCell {
    
    
    @IBOutlet weak var org: UILabel!
    
    @IBOutlet weak var dest: UILabel!
    
    
    @IBOutlet weak var bookid: UILabel!
    
}




class TFlightsTableViewController: UITableViewController {

    @IBOutlet var FlightsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        FlightsTableView.reloadData()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        FlightsTableView.reloadData()
        FlightsTableView.delegate = self
        
        FlightsTableView.dataSource = self
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
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
        return fnameArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> FlightTableViewCellBOOKED {
        
        var cell : FlightTableViewCellBOOKED = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FlightTableViewCellBOOKED
        
        
        let fruitName = forgArray[indexPath.row]
        cell.org?.text = fruitName
        
        let fruitName2 = fdestArray[indexPath.row]
        cell.dest?.text = fruitName2
        
        
        let fruitName3 = fidArray[indexPath.row]
        cell.bookid?.text = fruitName3
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
        
        flightNameBOOKED = fnameArray[indexPath.row]
        
        flightPriceBOOKED = fpriceArray[indexPath.row]
        
        flightOrgBOOKED = forgArray[indexPath.row]
        
        flightDestBOOKED = fdestArray[indexPath.row]
        
        flightDateBOOKED = fdateArray[indexPath.row]
        
        flightCurrencyBOOKED = fcurrencyArray[indexPath.row]
        
        flightbookidBOOKED = fidArray[indexPath.row]
        
        flightpersonsBOOKED = fpersonsArray[indexPath.row]
        
        
        performSegue(withIdentifier: "toFirebaseFlightDetail", sender: self)
        
        
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
