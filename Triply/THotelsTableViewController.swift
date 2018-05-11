//
//  THotelsTableViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/27/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit



var hotelCityBOOKED:String?

var hotelPriceBOOKED:String?

var hotelNameBOOKED:String?

var hotelcurrBOOKED:String?

var hotelline1BOOKED:String?

var hotelpostalBOOKED:String?

var hotelbookidBOOKED:String?

var hotelpersonBOOKED:String?





class HotelTableViewCellBOOKED: UITableViewCell {
    
    
    @IBOutlet weak var hotelname: UILabel!
    
    
    @IBOutlet weak var bookingid: UILabel!
    
    
}




class THotelsTableViewController: UITableViewController {

    @IBOutlet var hotelTableView: UITableView!
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        hotelTableView.reloadData()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        
        hotelTableView.reloadData()
        hotelTableView.delegate = self
        
        hotelTableView.dataSource = self
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hnameArray.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> HotelTableViewCellBOOKED {

          var cell : HotelTableViewCellBOOKED = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HotelTableViewCellBOOKED
        
        
        
        let fruitName = hnameArray[indexPath.row]
        cell.hotelname?.text = fruitName
        
        let fruitName2 = hidArray[indexPath.row]
        cell.bookingid?.text = fruitName2
        

        return cell
    }
 
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
        hotelCityBOOKED = hcityArray[indexPath.row]
        
        hotelPriceBOOKED = hpriceArray[indexPath.row]
        
        hotelNameBOOKED = hnameArray[indexPath.row]
        
        hotelcurrBOOKED = hcurrencyArray[indexPath.row]
        
        hotelline1BOOKED = hline1Array[indexPath.row]
        
        hotelpostalBOOKED = hpostalArray[indexPath.row]
        
        hotelbookidBOOKED = hidArray[indexPath.row]
        
        hotelpersonBOOKED = hpersonsArray[indexPath.row]
        
        performSegue(withIdentifier: "toFirebaseHotelDetail", sender: self)
        
        
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
